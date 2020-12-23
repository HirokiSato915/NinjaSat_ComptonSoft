#! /usr/bin/env ruby

require 'comptonsoft'
require '../../NinjaSatGeometry/build/rubyext/NinjaSatGeometry'

def run_simulation(num, random, output)
  sim = ComptonSoft::Simulation.new
  sim.output = output
  sim.random_seed = random
  sim.verbose = 0
  sim.print_detector_info
  sim.set_database(detector_configuration: "database/detector_configuration.xml",
                   detector_parameters: "database/detector_parameters.xml")
  sim.set_geometry NinjaSatGeometry::NinjaSatMainGeometry
  sim.set_physics(hadron_hp: false, cut_value: 0.001)

  sim.set_primary_generator :IsotropicPrimaryGen, {
    particle: "gamma",
    photon_index: 1.29,
    energy_min: 1.0,
    energy_max: 200.0,
    center_position: vec(0.0, 0.0, 0.75), # cm
    center_direction: vec(0.0, 0.0, -1.0),
    distance: 12.0, # cm
    radius: 5.4, # cm
  }

  sim.run(num)
end

### main ###
num = 1000000000
output = "cxb_simulation.root"
random = 0
run_simulation(num, random, output)
