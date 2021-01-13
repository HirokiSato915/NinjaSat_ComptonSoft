#! /usr/bin/env ruby

require 'comptonsoft'
require 'NinjaSatGeometry'

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
    particle: "proton",
    photon_index: 2.0,
    energy_min: 1.0e7,
    energy_max: 1.0e7,
    center_position: vec(0.0, 0.0, 0.75), # cm
    center_direction: vec(0.0, 0.0, -1.0),
    distance: 12.0, # cm
    radius: 12.0
  }

  sim.record_raw_hits
  sim.run(num)
end

### main###
num = 10000
output = "simulation_proton.root"
random = 0
run_simulation(num, random, output)
