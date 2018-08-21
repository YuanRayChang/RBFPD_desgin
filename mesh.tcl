#set user profile as abaqus standard3D
*templatefileset "D:/Program Files/Altair/13.0/templates/feoutput/abaqus/standard.3d" 
*menufilterset "*" 
*menufilterdisable  
*elementtype 104 7 
*elementtype 210 3 
*elementtype 213 3 
*elementtype 220 3 
*elementtype 5 1 
*elementtype 55 1 
*elementtype 206 1 
*elementtype 205 7 
*elementtype 208 7 
*elementtype 56 2 
*setmacrofile "D:/Program Files/Altair/13.0/hm/scripts/UserProfiles/../abaqus/abaqus.mac" 
*enablemacromenu 1 
*elementtype 104 7 
*elementtype 210 3 
*elementtype 213 3 
*elementtype 220 3 
*elementtype 5 1 
*elementtype 55 1 
*elementtype 206 1 
*elementtype 205 7 
*elementtype 208 7 
*elementtype 56 2 
*elementtype 104 7 
*elementtype 210 3 
*elementtype 213 3 
*elementtype 220 3 
*elementtype 5 1 
*elementtype 55 1 
*elementtype 206 1 
*elementtype 205 7 
*elementtype 208 7 
*elementtype 56 2 
::UserProfiles::LoadUserProfileFromName Abaqus standard3D
# read hm file
set script_path [ file dirname [ file normalize [ info script ] ] ]
append script_path "/raw.hm"
*readfile $script_path
*setgeomrefinelevel 1
# input STEP file
*setgeomrefinelevel 1
*createstringarray 2 "CADIO_AVOID_EDGES_MERGING" "CADIO_SPLIT_COMPONENTS_BY_BODY"
*feinputwithdata2 "#ct/step_reader" "E:/cantilever_PMMA_2/step/0_0.STEP" 1 0 0.001 1 0 1 2 1 0
# check if the components number is 2
if {[hm_count comp all 0 0]!=2} {
     *quit 1
}
# rename
*renamecollector components "Combine1" "bone"
*renamecollector components "Combine3" "resin"
# create shared surface by boolean
*createmark solids 1 "by comp name" resin
*createmark solids 2 "by comp name" bone
if {[ catch {*boolean_merge_solids 1 2 14 1 }]==1} {
puts error1!
*createmark solids 1 "by comp name" bone
*createmark solids 2 "by comp name" resin
*boolean_merge_solids 1 2 14 1
}
#edge edit, equivalence, cleanup tol=0.01, equiv free edges only
*createmark surfaces 1  "all"
*selfstitchcombine 1 82 0.01 0.01 
# automesh 2D: surface size and bias
*setedgedensitylinkwithaspectratio -1 
*elementorder 1 
*createmark surfaces 1  "all"
*defaultremeshsurf 1 0.2 0 0 2 1 1 1 1 0 0 0 0 
# automesh 2D: element QI optimization for resin
*setedgedensitylink 0 
*createdoublearray 89  1 1 0.2 0.18 0.08 0.04 0.02 0 1 0.2 0.24 0.3 0.4 0.6 1 1 1 2 4.4 5 10 1 1 0 5 13 15 30 1 1 90 110 134 140 160 1 1 90 70 46 40 20 1 1 60 80 112 120 150 1 1 60 50 34 30 15 1 1 0 10 34 40 70 1 1 1 0.9 0.7 0.6 0.3 0 1 0 0.3 0.8 1 2 1 1 0 6 10 15 20 0 0 0.8 1 10
*reset_qa_calculator 1 89 
*elementorder 1 
*setusefeatures 3 
*createmark elements 1 "by comp name" resin
*optimized_elements_remesh2 1 "dummy" 0.2 0 30 30 1 0 0 
*setusefeatures 0 
puts "finished automeshing resin "
# hide resin
*createmark components 2  "resin"
*createstringarray 2  "geometry_on" "elements_on"
*hideentitybymark 2 1 2 
# automesh 2D: element QI optimization for the rest
# enamel
*setedgedensitylink 0 
*createdoublearray 89  1 1 0.2 0.18 0.08 0.04 0.02 0 1 0.2 0.24 0.3 0.4 0.6 1 1 1 2 4.4 5 10 1 1 0 5 13 15 30 1 1 90 110 134 140 160 1 1 90 70 46 40 20 1 1 60 80 112 120 150 1 1 60 50 34 30 15 1 1 0 10 34 40 70 1 1 1 0.9 0.7 0.6 0.3 0 1 0 0.3 0.8 1 2 1 1 0 6 10 15 20 0 0 0.8 1 10
*reset_qa_calculator 1 89 
*elementorder 1 
*setusefeatures 3 
*createmark elements 1 "by box" 79 -100 28.5 110 -84 42 0 inside 0 0 0
*optimized_elements_remesh2 1 "dummy" 0.2 0 30 30 1 0 0 
*setusefeatures 0 
# box
*setedgedensitylink 0 
*createdoublearray 89  1 1 0.2 0.18 0.08 0.04 0.02 0 1 0.2 0.24 0.3 0.4 0.6 1 1 1 2 4.4 5 10 1 1 0 5 13 15 30 1 1 90 110 134 140 160 1 1 90 70 46 40 20 1 1 60 80 112 120 150 1 1 60 50 34 30 15 1 1 0 10 34 40 70 1 1 1 0.9 0.7 0.6 0.3 0 1 0 0.3 0.8 1 2 1 1 0 6 10 15 20 0 0 0.8 1 10
*reset_qa_calculator 1 89 
*elementorder 1 
*setusefeatures 3 
*createmark elements 1 "by box" 79 -100 28.5 110 -84 42 0 outside 0 0 0
*optimized_elements_remesh2 1 "dummy" 0.8 0 30 30 1 0 0 
*setusefeatures 0 
puts "finished automeshing the rest "
# set force 100N on resin
*retainmarkselections 1 
*currentcollector loadcols "load" 
*retainmarkselections 0 
*createmark elems 1 "by comp name" resin
*clearmark nodes 1
 set list1 {}
for {set i 1} {$i<=25} { incr i} {
     set nodeID [hm_getclosestnode 98.972 -94.566 37.082 1 1]
	 lappend list1 $nodeID
     #puts "node$i\t$nodeID"
     *appendmark nodes 1 $nodeID
}
foreach n $list1 {
*clearmark nodes 1
*createmark nodes 1 $n
# 4N
*loadcreateonentity_curve nodes 1 1 1 0 2.8284 -2.8284 0 0 3.99996164 0 0 0 0 0  
}
# tetramesh
*createstringarray 2  "pars: upd_shell fix_comp_bdr" "tet: 291 1.2 2 0 0.8 0"
*createmark components 2  "bone" "resin"
*tetmesh components 2 1 elements 0 -1 1 2 
puts "finished tetrameshing"
if {[hm_count comp all 0 0]!=4} {
     *quit 1
}
# rename
*createmark elems 1 "by comp id" "3"
*clearmark nodes 1
set nodeID1 [hm_getclosestnode 88.4184 -96.5072 39.7932 1 1]
*createmark elems 1 "by comp id" "4"
*clearmark nodes 1
set nodeID2 [hm_getclosestnode 88.4184 -96.5072 39.7932 1 1]
*createmark nodes 1 $nodeID1
set d1 [hm_measureshortestdistance2 88.4184 -96.5072 39.7932 nodes 1 0 0]
set d1_d [lindex $d1 0]
*createmark nodes 1 $nodeID2
set d2 [hm_measureshortestdistance2 88.4184 -96.5072 39.7932 nodes 1 0 0]
set d2_d [lindex $d2 0]
array set arr [list 0 $d1_d 1 $d2_d]
set min [expr min($arr(0),$arr(1))]
if {$d1_d == $min } {
*renamecollector components "volume001" "bone_3d"
*renamecollector components "volume002" "resin_3d"
}
if {$d2_d == $min } then {
*renamecollector components "volume002" "bone_3d"
*renamecollector components "volume001" "resin_3d"
} 
# fix
*retainmarkselections 1 
*currentcollector loadcols "fix" 
*retainmarkselections 0 
*createmark nodes 1 "by box" 84.56 -100 29.5 84.57 -84 9.3 0 inside 0 0 0
*loadcreateonentity_curve nodes 1 3 1 0 0 0 0 0 0 0 0 0 0 0 
*createmark nodes 1 "by box" 104.56 -100 29.5 104.57 -84 9.3 0 inside 0 0 0
*loadcreateonentity_curve nodes 1 3 1 0 0 0 0 0 0 0 0 0 0 0 
# set material & property
*createmark components 1 bone_3d
set id_bone [hm_getmark comps 1]
*setvalue comps id=$id_bone propertyid={props 1} 
*createmark components 1 resin_3d
set id_resin [hm_getmark comps 1]
*setvalue comps id=$id_resin propertyid={props 2} 
# delete 2D components
*retainmarkselections 1 
*createmark components 1  "bone" "resin"
*deletemark components 1 
*retainmarkselections 0 
# detach: mask bone then use 'displayed' to select false tooth. Finally  show enamel.
*createmark components 2  "bone_3d"
*createstringarray 2  "geometry_on" "elements_on"
*hideentitybymark 2 1 2 
*createmark elements 1  "displayed"
*detachelements 1 0 
# *** contact pair ***
# "bone_3d" "resin_3d"
# open contact manager
source [file join [hm_info -appinfo SPECIFIEDPATH hm_scripts_dir] abaqus Contact_wizard CW.tcl]
# open autocontact
::autocontact::CWautocontact::AutoContactGui
# invoke selecting components>all
*createmark comps 1 "bone_3d" "resin_3d"
set ::autocontact::CWautocontact1::newElems [hm_getmark comps 1]
::AbaqusCW::HighLight off
if {$::autocontact::CWautocontact::flag==1} {
     set ::autocontact::CWautocontact::flag 0
}
if {[llength $::autocontact::CWautocontact1::newElems]} {
     ::autocontact::CWautocontact1::AddCompsToTable
}
# set proximity distance
set ::autocontact::CWautocontact1::proximity_entry 0.01
# set reverse angle
set ::autocontact::CWautocontact1::reverse_angle 8.0
# invoke "Find" button
::autocontact::CWautocontact::UpdateInterface
# invoke "create" button
::autocontact::CreateEntities .autocontactGui.outer_frame.results_tree
# close contact manager
::AbaqusCW::CloseCW
# swap slave-master surface
set g1 [hm_getvalue groups id=1 dataname=name]
if {$g1=="S:bone_3d"} then {
*setvalue groups id=3 STATUS=2 2026={groups 1} 
*setvalue groups id=3 STATUS=2 2025={groups 2} 
} else {
*setvalue groups id=3 STATUS=2 2026={groups 2} 
*setvalue groups id=3 STATUS=2 2025={groups 1} 
}
# set contact pair 
# Adjust
*setvalue groups id=3 STATUS=2 321=1 
*setvalue groups id=3 STATUS=2 322="0" 
#property
*setvalue groups id=3 STATUS=2 81={props 5} 
#tied
*setvalue groups id=3 STATUS=2 326=1 
#Type
*setvalue groups id=3 STATUS=2 2744=1 
*setvalue groups id=3 STATUS=2 2745="SURFACE TO SURFACE" 
#create node sets
*createmark nodes 1 "by group" "S:resin_3d"
*entitysetcreate "resin0" nodes 1 
# save input file
*retainmarkselections 0 
*createstringarray 1  "EXPORTIDS_SKIP"
*feoutputwithdata "D:/Program Files/Altair/13.0/templates/feoutput/abaqus/standard.3d" "E:/cantilever_PMMA_2/inp/0_0.inp" 0 0 1 1 1
*writefile "E:/cantilever_PMMA_2/hm/0_0.hm" 1
*quit 1