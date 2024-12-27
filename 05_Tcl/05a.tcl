set f [open "input.txt" r]
set lst [split [read $f] "\n"]
close $f

set lst_len [llength $lst]
set i 0

for {} {$i < $lst_len} {incr i} {
    set rule [split [lindex $lst $i] "|"]
    if {[llength $rule] == 2} {
        set rules([list [lindex $rule 0] [lindex $rule 1]]) 1
    } else {
        break
    }
}

incr i
set sum 0

for {} {$i < $lst_len} {incr i} {
    set updates [split [lindex $lst $i] ","]
    set updates_len [llength $updates]
    set ok 1
    for {set i1 0} {$i1 < [expr {$updates_len - 1}]} {incr i1} {
        set p1 [lindex $updates $i1]
        for {set i2 [expr {$i1 + 1}]} {$i2 < $updates_len} {incr i2} {
            set p2 [lindex $updates $i2]
            if {![info exists rules([list $p1 $p2])]} {
                set ok 0
                break
            }
        }
        if {$ok == 0} {
            break
        }
    }
    if {$ok == 1} {
        set mid [expr {($updates_len - 1) / 2}]
        set sum [expr {$sum + [lindex $updates $mid]}]
    }
}

puts $sum