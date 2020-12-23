#! /usr/bin/env ruby

require 'comptonsoft'
require '../../NinjaSatGeometry/build/rubyext/NinjaSatGeometry'

def run_simulation(num)
  energy = 30.0 # keV

  sim = ComptonSoft::Simulation.new
  sim.random_seed = 0
  sim.set_geometry NinjaSatGeometry::NinjaSatMainGeometry
  
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

  # sim.set_primary_generator :PlaneWavePrimaryGen, {
  #   particle: "gamma",
  #   photon_index: 0.0,
  #   energy_min: energy,
  #   energy_max: energy,
  #   position: vec(0.0, 0.0, 10.0),
  #   direction: vec(0.0, 0.0, -1.0),
  #   radius: 5.0,
  # }

  sim.visualize(mode: 'OGLSQt')
  sim.run(num)
end

### main ###
num = 500
run_simulation(num)
