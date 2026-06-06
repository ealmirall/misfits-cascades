using Agents
using Graphs
using Misfits
using Random
using Test

function no_growth_model(g; seed_nodes, thresholds, rule=:complex)
    return make_model(
        g;
        rng=MersenneTwister(42),
        seed_nodes=seed_nodes,
        thresholds=thresholds,
        rule=rule,
        traditional_growth_mean=0.0,
        traditional_growth_sd=0.0,
        digital_growth_mean=0.0,
        digital_growth_sd=0.0,
        bankruptcy_floor=-1.0e9,
    )
end

@testset "Misfits cascades" begin
    @testset "adoption is monotone when firms are not replaced" begin
        g = complete_graph(10)
        model = no_growth_model(g; seed_nodes=[1], thresholds=fill(0.4, 10))
        model[model.node_to_id[1]].valuation = 100.0
        for i in 2:10
            model[model.node_to_id[i]].valuation = 10.0 - i / 100
        end
        out = run_model(model; T=5, stall_window=5)
        @test all(diff(out.A) .>= -eps(Float64))
    end

    @testset "N remains constant across steps" begin
        g = path_graph(20)
        model = make_model(
            g;
            rng=MersenneTwister(7),
            seed_nodes=[1],
            thresholds=fill(0.25, 20),
            traditional_growth_mean=-2.0,
            traditional_growth_sd=0.0,
            digital_growth_mean=-2.0,
            digital_growth_sd=0.0,
        )
        for _ in 1:4
            model_step!(model)
            @test nagents(model) == 20
        end
    end

    @testset "small-world builder supports odd target degree when N is even" begin
        g, metrics = build_network(:small_world, (N=100, k=15, beta=0.1, path_samples=10); rng=MersenneTwister(9))
        @test nv(g) == 100
        @test metrics.realised_mean_degree ≈ 15.0
    end

    @testset "zero thresholds cascade on connected complete graph" begin
        g = complete_graph(12)
        model = no_growth_model(g; seed_nodes=[1], thresholds=zeros(12))
        model[model.node_to_id[1]].valuation = 100.0
        for i in 2:12
            model[model.node_to_id[i]].valuation = 20.0 - i
        end
        model_step!(model)
        @test adoption_fraction(model) == 1.0
    end

    @testset "threshold one can block adoption beyond seed" begin
        g = complete_graph(12)
        model = no_growth_model(g; seed_nodes=[1], thresholds=ones(12))
        model[model.node_to_id[1]].valuation = 1.0
        for i in 2:12
            model[model.node_to_id[i]].valuation = 20.0 + i
        end
        model_step!(model)
        @test adoption_fraction(model) == 1 / 12
    end

    @testset "fraction rule is degree invariant" begin
        g2 = complete_graph(3)
        m2 = no_growth_model(g2; seed_nodes=[2], thresholds=[0.5, 0.5, 0.5])
        m2[m2.node_to_id[1]].valuation = 1.0
        m2[m2.node_to_id[2]].valuation = 3.0
        m2[m2.node_to_id[3]].valuation = 2.0

        g4 = complete_graph(5)
        m4 = no_growth_model(g4; seed_nodes=[2, 3], thresholds=fill(0.5, 5))
        m4[m4.node_to_id[1]].valuation = 1.0
        for i in 2:5
            m4[m4.node_to_id[i]].valuation = 2.0 + i
        end

        @test Misfits.adoption_decision(m2, m2[m2.node_to_id[1]])
        @test Misfits.adoption_decision(m4, m4[m4.node_to_id[1]])

        m2[m2.node_to_id[1]].threshold = 0.6
        m4[m4.node_to_id[1]].threshold = 0.6
        @test !Misfits.adoption_decision(m2, m2[m2.node_to_id[1]])
        @test !Misfits.adoption_decision(m4, m4[m4.node_to_id[1]])
    end

    @testset "replacement digital rule is explicit" begin
        g = path_graph(5)
        traditional_model = make_model(
            g;
            rng=MersenneTwister(11),
            seed_nodes=[1],
            thresholds=fill(0.25, 5),
            p_digital=1.0,
            traditional_growth_mean=-2.0,
            traditional_growth_sd=0.0,
            digital_growth_mean=-2.0,
            digital_growth_sd=0.0,
            replacement_digital_rule=:traditional_only,
        )
        model_step!(traditional_model)
        @test all(!a.is_digital for a in allagents(traditional_model))

        seeded_model = make_model(
            g;
            rng=MersenneTwister(11),
            seed_nodes=[1],
            thresholds=fill(0.25, 5),
            p_digital=1.0,
            traditional_growth_mean=-2.0,
            traditional_growth_sd=0.0,
            digital_growth_mean=-2.0,
            digital_growth_sd=0.0,
            replacement_digital_rule=:bernoulli_seed_probability,
        )
        model_step!(seeded_model)
        @test all(a.is_digital for a in allagents(seeded_model))
    end

    @testset "single replacement threshold draw preserves mixture probability" begin
        params = (theta_mean=0.70, pi=0.20, theta_low=0.05)
        rng = MersenneTwister(123)
        draws = [Misfits.draw_one_threshold(:mixture, params; rng=rng) for _ in 1:1000]
        low_count = count(==(0.05), draws)
        @test 150 <= low_count <= 250

        high_only = Misfits.draw_one_threshold(:mixture, (theta_mean=0.70, pi=0.0, theta_low=0.05); rng=MersenneTwister(1))
        @test high_only ≈ 0.70
    end

    @testset "stricter success rule requires enough successful digital neighbours" begin
        g = complete_graph(4)
        model = no_growth_model(g; seed_nodes=[2], thresholds=fill(0.5, 4))
        model.min_successful_digital = 2
        model[model.node_to_id[1]].valuation = 1.0
        model[model.node_to_id[2]].valuation = 4.0
        model[model.node_to_id[3]].valuation = 3.0
        model[model.node_to_id[4]].valuation = 2.0
        @test !Misfits.adoption_decision(model, model[model.node_to_id[1]])

        model[model.node_to_id[3]].is_digital = true
        @test Misfits.adoption_decision(model, model[model.node_to_id[1]])

        model.success_denominator = :all_neighbors
        model[model.node_to_id[1]].threshold = 0.75
        @test !Misfits.adoption_decision(model, model[model.node_to_id[1]])
    end

    @testset "complex adoptions log successful-exemplar exposure" begin
        g = complete_graph(4)
        model = no_growth_model(g; seed_nodes=[2, 3], thresholds=fill(0.5, 4))
        model[model.node_to_id[1]].valuation = 1.0
        model[model.node_to_id[2]].valuation = 4.0
        model[model.node_to_id[3]].valuation = 3.0
        model[model.node_to_id[4]].valuation = 2.0

        result = run_model(model; T=1, stall_window=5)
        node1_logs = [event for event in result.adoption_log if event.node == 1]
        @test length(node1_logs) == 1
        event = only(node1_logs)
        @test event.t == 1
        @test event.better_count == 3
        @test event.successful_digital_count == 2
        @test event.exposure_share ≈ 2 / 3
        @test event.threshold ≈ 0.5
    end
end
