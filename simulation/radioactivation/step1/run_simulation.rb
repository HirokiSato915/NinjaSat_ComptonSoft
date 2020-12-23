#! /usr/bin/env ruby

require 'comptonsoft'
require '../../../../NinjaSatGeometry/build/rubyext/NinjaSatGeometry'

def run_simulation(num, random, output)
  sim = ComptonSoft::Simulation.new
  sim.output = output
  sim.random_seed = random
  sim.verbose = 0
  sim.print_detector_info
  sim.set_database(detector_configuration: "../database/detector_configuration.xml",
                   detector_parameters: "../database/detector_parameters.xml")
  sim.set_geometry NinjaSatGeometry::NinjaSatMainGeometry
  sim.set_physics(physics_list: "QGSP_BIC_HP_RD")

  sim.set_primary_generator :IsotropicPrimaryGen, {
    particle: "proton",
    spectral_distribution: "histogram",
    energy_array: [10.00E+03, 15.00E+03, 20.00E+03, 30.00E+03, 40.00E+03, 50.00E+03, 60.00E+03,
                   70.00E+03, 100.00E+03, 150.00E+03, 200.00E+03, 300.00E+03, 400.00E+03], # keV
    photons_array: [9.9042E-01*5, 3.9828E-01*5, 2.4993E-01*10, 1.5914E-01*10, 1.2774E-01*10, 1.2233E-01*10,
                    1.2163E-01*10, 1.1064E-01*30, 8.3020E-02*50, 4.7739E-02*50, 2.5538E-02*100, 8.3416E-03*100],
    center_position: vec(0.0, 0.0, 0.75), # cm
    center_direction: vec(0.0, 0.0, -1.0),
    distance: 12.0, # cm
    radius: 5.5, # cm
  }

  sim.set_user_action :ActivationUserActionAssembly, {
    output_filename_base: output.sub(".root", ".act"),
    detection_by_generation: false,
    processes_to_detect: ["RadioactiveDecay"],
  }

  sim.run(num)
end

### Main
num = 20000000
output = "simulation.root"
random = 0
run_simulation(num, random, output)