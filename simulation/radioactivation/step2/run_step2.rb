#!/usr/bin/env ruby

require 'comptonsoft/decayChains'

production_file = "../step1/simulation.act.summary.dat"
time_profile_file = "time_profile.dat"
output_file = "decay_rates.dat"
measurement_start_time =  2588880.0 # second

calculator = DecayChains::RIDecayCalculation.new
calculator.setVerboseLevel 3
calculator.setInputFiles production_file, time_profile_file
calculator.setMeasurementTime measurement_start_time
calculator.setOutputFile output_file

calculator.run
