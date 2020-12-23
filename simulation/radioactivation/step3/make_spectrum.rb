#!/usr/bin/env ruby

require "RubyROOT"

file_list = Dir.glob("sim_decay_Collimeter_*.root")
# file_list = Dir.glob("sim_decay_Collimeter_*.root")
file_output = "collimeter_spectrum.root"
exposure =  10000000.0

tree = Root::TChain.new("hittree", "hittree")
file_list.each do |file|
  tree.AddFile file
end

Root::TFile.open(file_output, "recreate") do |fout|
  spectrum = Root::TH1D.create("spectrum", "spectrum", 990, 1.0, 100.0)
  tree.read.each do |row|
    spectrum.Fill(row.edep)
  end
  spectrum.Sumw2
  spectrum.Scale(10.0/exposure)
  fout.Write
end