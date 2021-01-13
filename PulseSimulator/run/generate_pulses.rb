#!/usr/bin/env ruby

require 'comptonsoft'
require 'ninjaSatPulseSimulator'

class PulseSim < ANL::ANLApp
  def setup()
    chain ComptonSoft::CSHitCollection

    chain ComptonSoft::ReadHitTree
    with_parameters(file_list: ["simulation_proton.root"])

    chain NinjaSatPulseSimulator::GenerateEvents
    with_parameters(origin: vec(0.0, 0.0, -0.55),
                    inner_radius: 5.0/2,
                    outer_radius: 6.7/2,
                    drift_velocity: 1.0*1.0e6,
                    diffusion_coefficient_: 50.0,
                    num_bins: 400,
                    t0: 0.0,
                    t1: 4.0)

    chain ComptonSoft::SaveData
    with_parameters(output: "pulses.root")
  end
end

a = PulseSim.new
a.run(:all)
