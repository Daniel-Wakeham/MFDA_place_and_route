// ^^^ routing and px/layer defines are added at runtime ^^^ //

module valve_20px_1(xpos, ypos, zpos, orientation){
    
    // Parameteres
    h_fluid = 2*layer;
    t_memb = layer;
    h_air = 4*layer;
    h_total = h_fluid + t_memb + h_air; // 7*layer
    d_valve = 20*px;
    
    // Valve connection channels
    xychan0 = 6*px;
    xychan = 8*px;
    hchan = 5*layer;
    hchan_px = 8*px;
    wchan = 8*px;

    dimm        =   [  
                        [[0, 0], [-wchan/2, wchan/2], [0, hchan]], // 0
                        [[-wchan/2, wchan/2], [0, 0], [0, hchan]], // 1
                        [[-xychan/2, xychan/2], [-xychan/2, xychan/2], [0, 0]], // 2
                        [[-xychan0/2, xychan0/2], [-xychan0/2, xychan0/2], [0, 0]], // 3
                        [[-xychan/2, xychan/2], [0, hchan_px], [0, 0]], // 4
                    ];
                    
    overlap_v_xy  = 2*px;
    
    module obj(){
        // Fluid compartment
        color("CadetBlue")
        cylinder(d = d_valve, h = h_fluid);
        
        // Air compartment
        color("SteelBlue")
        translate([0,0,h_fluid + t_memb])
        cylinder(d = d_valve, h = h_air);    
            
        // Fluid in channel connection
        pt_fluid_in         = [0, -d_valve/2 + overlap_v_xy, 1*layer - hchan];
        pt_fluid_in_next    = [
                                ["+y", -21*px, 1],
                              ];
        color("Blue")
        routing(pt_fluid_in,pt_fluid_in_next, dimm);
        
        // Fluid out channel connection
        pt_fluid_out        = [0, d_valve/2 - overlap_v_xy, 1*layer - hchan];
        pt_fluid_out_next   = [
                                ["+y", 21*px, 1],
                              ];
        color("Red")
        routing(pt_fluid_out,pt_fluid_out_next, dimm);
        
        // Air control channel connection
        pt_air_control      = [-d_valve/2 - xychan/2 + 6*px, 0, h_total];
        pt_air_control_next = [
                                ["+zx", [9*layer, -21*px]],
                              ];
        
        color("Red")
        routing(pt_air_control,pt_air_control_next, dimm);
        
        // Air flushing channel connection
        pt_air_flush        = [d_valve/2 + xychan/2 - 6*px, 0, h_total];
        pt_air_flush_next   = [
                                ["+zx", [9*layer, 21*px]],
                              ];
        color("Blue")
        routing(pt_air_flush,pt_air_flush_next, dimm);
    }
    
    if (orientation == "N"){
        rotate(270)
        translate([-25*px*2 - ypos*px, 25*px*2 + xpos*px, 4*layer + zpos*layer])
        obj();
    }
    if (orientation == "FN"){
        mirror([1, 0 , 0])
        rotate(270)
        translate([-25*px*2 - ypos*px, -25*px*2 - xpos*px, 4*layer + zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        rotate(270)
        translate([25*px*2 + ypos*px, 25*px*2 + xpos*px, 4*layer + zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0 , 0])
        rotate(270)
        translate([25*px*2 + ypos*px, -25*px*2 - xpos*px, 4*layer + zpos*layer])
        obj();
    }
    
}

// Test
//valve_20px_1(0, 0, 0, "N");
//valve_20px_1(75, 0, 10, "FN");
//valve_20px_1(150, 0, 10, "FS");
//valve_20px_1(225, 0, 10, "S");

module valve_20px4way_0(xpos, ypos, zpos, orientation){
    
    // Parameteres
    h_fluid = 2*layer;
    t_memb = layer;
    h_air = 4*layer;
    h_total = h_fluid + t_memb + h_air; // 7*layer
    d_valve = 20*px;
    
    // Valve connection channels
    xychan0 = 6*px;
    xychan = 8*px;
    hchan = 5*layer;
    hchan_px = 8*px;
    wchan = 8*px;

    dimm        =   [  
                        [[0, 0], [-wchan/2, wchan/2], [0, hchan]], // 0
                        [[-wchan/2, wchan/2], [0, 0], [0, hchan]], // 1
                        [[-xychan/2, xychan/2], [-xychan/2, xychan/2], [0, 0]], // 2
                        [[-xychan0/2, xychan0/2], [-xychan0/2, xychan0/2], [0, 0]], // 3
                        [[-xychan/2, xychan/2], [0, hchan_px], [0, 0]], // 4
                    ];
                    
    overlap_v_xy  = 2*px;
    
    module obj(){
        // Fluid compartment
        color("CadetBlue")
        cylinder(d = d_valve, h = h_fluid);
        
        // Air compartment
        color("SteelBlue")
        translate([0,0,h_fluid + t_memb])
        cylinder(d = d_valve, h = h_air);    
            
        // Fluid in channel connection
        pt_fluid_in         = [0, -d_valve/2 + overlap_v_xy, 1*layer - hchan];
        pt_fluid_in_next    = [
                                ["+y", -21*px, 1],
                              ];
        color("Blue")
        routing(pt_fluid_in,pt_fluid_in_next, dimm);
        
        // Fluid out channel connection
        pt_fluid_out        = [0, d_valve/2 - overlap_v_xy, 1*layer - hchan];
        pt_fluid_out_next   = [
                                ["+y", 21*px, 1],
                              ];
        color("Red")
        routing(pt_fluid_out,pt_fluid_out_next, dimm);
        
        rotate(90){
            // Fluid in channel connection
            pt_fluid_in         =   [0, -d_valve/2 + overlap_v_xy, 1*layer - hchan];
            pt_fluid_in_next    =   [
                                        ["+y", -21*px, 1],
                                    ];
            
            routing(pt_fluid_in,pt_fluid_in_next, dimm);
        
            // Fluid out channel connection
            pt_fluid_out        =   [0, d_valve/2 - overlap_v_xy, 1*layer - hchan];
            pt_fluid_out_next   =   [
                                        ["+y", 21*px, 1],
                                    ];
            
            routing(pt_fluid_out,pt_fluid_out_next, dimm);
        }
        
        // Air control channel connection
        pt_air_control      = [-d_valve/2 - xychan/2 + 6*px, 0, h_total];
        pt_air_control_next = [
                                ["+zx", [9*layer, -21*px]],
                              ];
        
        color("Red")
        routing(pt_air_control,pt_air_control_next, dimm);
        
        // Air flushing channel connection
        pt_air_flush        = [d_valve/2 + xychan/2 - 6*px, 0, h_total];
        pt_air_flush_next   = [
                                ["+zx", [9*layer, 21*px]],
                              ];
        color("Blue")
        routing(pt_air_flush,pt_air_flush_next, dimm);
    }
    
    if (orientation == "N"){
        rotate(270)
        translate([-25*px*2 - ypos*px, 25*px*2 + xpos*px, 4*layer + zpos*layer])
        obj();
    }
    if (orientation == "FN"){
        mirror([1, 0 , 0])
        rotate(270)
        translate([-25*px*2 - ypos*px, -25*px*2 - xpos*px, 4*layer + zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        rotate(270)
        translate([25*px*2 + ypos*px, 25*px*2 + xpos*px, 4*layer + zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0 , 0])
        rotate(270)
        translate([25*px*2 + ypos*px, -25*px*2 - xpos*px, 4*layer + zpos*layer])
        obj();
    }
    
}

// Test
//valve_20px4way_0(0, 0, 0, "N");
//valve_20px4way_0(75, 0, 10, "FN");
//valve_20px4way_0(150, 0, 10, "FS");
//valve_20px4way_0(225, 0, 10, "S");

module pump_40px_0(xpos, ypos, zpos, orientation){
    
    // Parameters
    d_DC = 40*px;       // DC diameter
    t_m_DC = layer;     // DC membrane thickness (2 layers of 5 um in JSON FILE)
    h_f_DC = 3*layer;   // height of the fluid chamber (DC) (2.5 layers in JSON FILE)
    h_c_DC = 6*layer;   // height of control chamber
    d_v = 20*px;        // valves diameter
    t_m_v = layer;      // valves membrane thickness (layer of 5 um in JSON FILE)
    h_f_v = 2*layer;    // height of fluid chamber (valves)
    h_c_v = 4*layer;    // height of control chamber (valves) (3.5 layers in JSON FILE)
    dist_v2v = d_DC + d_v + 40*px; // distance between valves centers
    dist_v2chan = 5*layer; // distance between valves bottom and horizontal connection channel
    
    // Channel Dimensions
    xychan0 = 6*px;  
    hchan = 10*layer;
    wchan = 12*px;
    xychan = 12*px;
    Wchan = 14*px;
    Hchan = 25*layer;
    hchan2 = 10*layer;
    ochan = 70*px;


    dim  = [
            [[0, 0], [-Wchan/2, Wchan/2], [0, hchan]],                  // 0
            [[-Wchan/2, Wchan/2], [0, 0], [0, hchan]],                  // 1
            [[-xychan/2, xychan/2], [-xychan/2, xychan/2], [0, 0]],     // 2
            [[-xychan0/2, xychan0/2], [-xychan0/2, xychan0/2], [0, 0]], // 3
            [[-wchan/2, wchan/2], [0, 0], [0, hchan2]],                 // 4
            [[-Wchan/2, Wchan/2], [-Wchan/2, Wchan/2], [0, 0]],         // 5
           ];
    
    // Submodules
    module valve(d, h_bot, h_top, t_memb){ 
        /*
        d :         diameter of the valve
        h_bot:      bottom chamber height
        h_top:      top chamber height
        t_memb:     membrane thickness
        */    
        
        // Bottom chamber
        color("SteelBlue")
        cylinder(d = d, h = h_bot, $fn = 100);
        
        // Top chamber
        color("CadetBlue")
        translate([0, 0, h_bot+t_memb])
        cylinder(d = d, h = h_top, $fn = 100);    
    }
    
    module obj(){
        //build DC
        valve(d_DC, h_f_DC, h_c_DC, t_m_DC);
        
        for (j = [0:1]){
            mirror([0, j, 0]){
                translate([0, dist_v2v/2, 0])
                
                // inlet and outlet 20 px valves
                valve(d_v, h_f_v, h_c_v, t_m_v);
                
                // fluid connection between valves and DC
                pi_0 = [0 , d_DC/2 - xychan/2, 0];
                pf_0 = [0, dist_v2v/2, 0];
                connect_0 = [
                             ["+z", -(dist_v2chan+hchan), 2],
                             ["yz", pf_0, [4,3]]
                            ];
                routing(pi_0, connect_0, dim);
            }
            
        }
        pi_1_0 = [0, 50*px, 7*layer];
        connect_1_0 = [["+x", -57*px, 0]];
        color("Red")
        routing(pi_1_0, connect_1_0, dim);
        
        pi_1_1 = [0, 50*px, 7*layer];
        connect_1_1 = [["+x", 57*px, 0]];
        color("Blue")
        routing(pi_1_1, connect_1_1, dim);
        
        pi_2 = [-57*px, -50*px, 7*layer];
        connect_2 = [["+x", 114*px, 0]];
        routing(pi_2, connect_2, dim);
        
        pi_3 = [-57*px, 0, 10*layer];
        connect_3 = [["+x", 114*px, 0]];
        routing(pi_3, connect_3, dim);
        
        pi_4 = [0, 59*px, -9*layer];
        connect_4 = [["+yz", [16*px, -4*layer], [1, 5]]];
        routing(pi_4, connect_4, dim);
        
        pi_5 = [0, -59*px, -9*layer];
        connect_5 = [["+yz", [-16*px, -4*layer], [1, 5]]];
        routing(pi_5, connect_5, dim);
    }
    
    if (orientation == "N"){
        translate([75*px + xpos*px, 100*px + ypos*px, 13*layer + zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror()
        translate([-75*px - xpos*px, 100*px + ypos*px, 13*layer + zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([75*px + xpos*px, -100*px - ypos*px, 13*layer + zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror()
        mirror([0, 1, 0])
        translate([-75*px - xpos*px, -100*px - ypos*px, 13*layer + zpos*layer])
        obj();
    }
    
}

// Test
//pump_40px_0(0, 0, 0, "N");
//pump_40px_0(114+25, 0, 0, "FN");
//pump_40px_0(114*2+25*2, 0, 0, "FS");
//pump_40px_0(114*3+25*3, 0, 0, "S");

module pump_40px_1(xpos, ypos, zpos, orientation){
    
    // Parameters
    d_DC = 40*px;       // DC diameter
    t_m_DC = layer;     // DC membrane thickness (2 layers of 5 um in JSON FILE)
    h_f_DC = 3*layer;   // height of the fluid chamber (DC) (2.5 layers in JSON FILE)
    h_c_DC = 6*layer;   // height of control chamber
    d_v = 20*px;        // valves diameter
    t_m_v = layer;      // valves membrane thickness (layer of 5 um in JSON FILE)
    h_f_v = 2*layer;    // height of fluid chamber (valves)
    h_c_v = 4*layer;    // height of control chamber (valves) (3.5 layers in JSON FILE)
    dist_v2v = d_DC + d_v + 40*px; // distance between valves centers
    dist_v2chan = 5*layer; // distance between valves bottom and horizontal connection channel
    
    // Channel Dimensions
    xychan0 = 6*px;  
    hchan = 10*layer;
    wchan = 12*px;
    xychan = 12*px;
    Wchan = 14*px;
    Hchan = 25*layer;
    hchan2 = 10*layer;
    ochan = 70*px;


    dim  = [
            [[0, 0], [-Wchan/2, Wchan/2], [0, hchan]],                  // 0
            [[-Wchan/2, Wchan/2], [0, 0], [0, hchan]],                  // 1
            [[-xychan/2, xychan/2], [-xychan/2, xychan/2], [0, 0]],     // 2
            [[-xychan0/2, xychan0/2], [-xychan0/2, xychan0/2], [0, 0]], // 3
            [[-wchan/2, wchan/2], [0, 0], [0, hchan2]],                 // 4
            [[-Wchan/2, Wchan/2], [-Wchan/2, Wchan/2], [0, 0]],         // 5           
           ];
    
    // Submodules
    module valve(d, h_bot, h_top, t_memb){ 
        /*
        d :         diameter of the valve
        h_bot:      bottom chamber height
        h_top:      top chamber height
        t_memb:     membrane thickness
        */    
        
        // Bottom chamber
        color("SteelBlue")
        cylinder(d = d, h = h_bot, $fn = 100);
        
        // Top chamber
        color("CadetBlue")
        translate([0, 0, h_bot+t_memb])
        cylinder(d = d, h = h_top, $fn = 100);    
    }
    
    module obj(){
        //build DC
        valve(d_DC, h_f_DC, h_c_DC, t_m_DC);
        
        for (j = [0:1]){
            mirror([0, j, 0]){
                translate([0, dist_v2v/2, 0])
                
                // inlet and outlet 20 px valves
                valve(d_v, h_f_v, h_c_v, t_m_v);
                
                // fluid connection between valves and DC
                pi_0 = [0 , d_DC/2 - xychan/2, 0];
                pf_0 = [0, dist_v2v/2, 0];
                connect_0 = [
                             ["+z", -(dist_v2chan+hchan), 2],
                             ["yz", pf_0, [4,3]]
                            ];
                routing(pi_0, connect_0, dim);
            }
            
        }
        pi_1_0 = [0, 50*px, 7*layer];
        connect_1_0 = [["+x", -57*px, 0]];
        color("Red")
        routing(pi_1_0, connect_1_0, dim);
        
        pi_1_1 = [0, 50*px, 7*layer];
        connect_1_1 = [["+x", 57*px, 0]];
        color("Blue")
        routing(pi_1_1, connect_1_1, dim);
        
        pi_2 = [-57*px, -50*px, 7*layer];
        connect_2 = [["+x", 114*px, 0]];
        routing(pi_2, connect_2, dim);
        
        pi_3 = [-57*px, 0, 10*layer];
        connect_3 = [["+x", 114*px, 0]];
        routing(pi_3, connect_3, dim);
        
        pi_4 = [0, 59*px, -9*layer];
        connect_4 = [["+yz", [16*px, -4*layer], [1, 5]]];
        routing(pi_4, connect_4, dim);
        
        pi_5 = [0, -59*px, -9*layer];
        connect_5 = [["+yz", [-16*px, -4*layer], [1, 5]]];
        routing(pi_5, connect_5, dim);
    }
    
    if (orientation == "N"){
        rotate(a = 270)
        translate([-75*px - ypos*px, 100*px + xpos*px, 13*layer + zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror()
        rotate(a = 270)
        translate([-75*px - ypos*px, -100*px - xpos*px, 13*layer + zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        rotate(a = 270)
        translate([75*px + ypos*px, 100*px + xpos*px, 13*layer + zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror()
        mirror([0, 1, 0])
        rotate(a = 270)
        translate([75*px + ypos*px, -100*px - xpos*px, 13*layer + zpos*layer])
        obj();
    }
    
}

// Test
//pump_40px_1(0, 0, 0, "N");
//pump_40px_1(175, 0, 0, "FN");
//pump_40px_1(175*2, 0, 0, "FS");
//pump_40px_1(175*3, 0, 0, "S");

module serpentine_25px_0(xpos, ypos, zpos, orientation){
    
    // Sub-modules
    module obj(){
        translate([18*px, 18*px, 0])       
        routing(
            dimm = [
                    [[0, 0], [0, 14*px], [0, 10*layer]],
                    [[0, 14*px], [0, 0], [0, 10*layer]]
                    ],
            p0 = [0, 0, 0],
            pf = [
                    ["+yx", [25*px, 25*px+14*px], [1, 0]]
                    ]
        );
        
    }
    
    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-3*25*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -3*25*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-3*25*px - xpos*px, -3*25*px - ypos*px, zpos*layer])
        obj();
    }
    
}

// Test
//serpentine_25px_0(0, 0, 0, "N");
//serpentine_25px_0(0, 0, 0, "FN");
//serpentine_25px_0(0, 0, 0, "FS");
//serpentine_25px_0(0, 0, 0, "S");

module serpentine_50px_0(xpos, ypos, zpos, orientation){
    
    // Sub-modules
    module obj(){
        translate([18*px, 18*px, 0])       
        routing(
            dimm = [
                    [[0, 0], [0, 14*px], [0, 10*layer]],
                    [[0, 14*px], [0, 0], [0, 10*layer]]
                    ],
            p0 = [0, 0, 0],
            pf = [
                    ["+yx", [50*px, 25*px], [1, 0]],
                    ["+yx", [-50*px, 25*px+14*px], [1, 0]]
                    ]
        );
        
    }
    
    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-4*25*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -4*25*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-4*25*px - xpos*px, -4*25*px - ypos*px, zpos*layer])
        obj();
    }
    
}

// Test
//serpentine_50px_0(0, 0, 0, "N");
//serpentine_50px_0(0, 0, 0, "FN");
//serpentine_50px_0(0, 0, 0, "FS");
//serpentine_50px_0(0, 0, 0, "S");

module serpentine_75px_0(xpos, ypos, zpos, orientation){
    
    // Sub-modules
    module obj(){
        translate([18*px, 18*px, 0])       
        routing(
            dimm = [
                    [[0, 0], [0, 14*px], [0, 10*layer]],
                    [[0, 14*px], [0, 0], [0, 10*layer]]
                    ],
            p0 = [0, 0, 0],
            pf = [
                    ["+yx", [75*px, 25*px], [1, 0]],
                    ["+yx", [-75*px, 25*px], [1, 0]],
                    ["+yx", [75*px, 25*px+14*px], [1, 0]]
                    ]
        );
        
    }
    
    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-5*25*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -5*25*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-5*25*px - xpos*px, -5*25*px - ypos*px, zpos*layer])
        obj();
    }
    
}

// Test
//serpentine_75px_0(0, 0, 0, "N");
//serpentine_75px_0(0, 0, 0, "FN");
//serpentine_75px_0(200, 0, 0, "FS");
//serpentine_75px_0(300, 0, 0, "S");

module serpentine_100px_0(xpos, ypos, zpos, orientation){
    
    // Sub-modules
    module obj(){
        translate([18*px, 18*px, 0])       
        routing(
            dimm = [
                    [[0, 0], [0, 14*px], [0, 10*layer]],
                    [[0, 14*px], [0, 0], [0, 10*layer]]
                    ],
            p0 = [0, 0, 0],
            pf = [
                    ["+yx", [100*px, 25*px], [1, 0]],
                    ["+yx", [-100*px, 25*px], [1, 0]],
                    ["+yx", [100*px, 25*px], [1, 0]],
                    ["+yx", [-100*px, 25*px+14*px], [1, 0]]
                    ]
        );
        
    }
    
    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-6*25*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -6*25*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-6*25*px - xpos*px, -6*25*px - ypos*px, zpos*layer])
        obj();
    }
    
}

// Test
//serpentine_100px_0(0, 0, 0, "N");
//serpentine_100px_0(0, 0, "FN");
//serpentine_100px_0(0, 0, "FS");
//serpentine_100px_0(0, 0, "S");

module serpentine_150px_0(xpos, ypos, zpos, orientation){
    
    // Sub-modules
    module obj(){
        translate([18*px, 18*px, 0])       
        routing(
            dimm = [
                    [[0, 0], [0, 14*px], [0, 10*layer]],
                    [[0, 14*px], [0, 0], [0, 10*layer]]
                    ],
            p0 = [0, 0, 0],
            pf = [
                    ["+yx", [150*px, 25*px], [1, 0]],
                    ["+yx", [-150*px, 25*px], [1, 0]],
                    ["+yx", [150*px, 25*px], [1, 0]],
                    ["+yx", [-150*px, 25*px], [1, 0]],
                    ["+yx", [150*px, 25*px], [1, 0]],
                    ["+yx", [-150*px, 25*px+14*px], [1, 0]]
                    ]
        );
        
    }
    
    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-8*25*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -8*25*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-8*25*px - xpos*px, -8*25*px - ypos*px, zpos*layer])
        obj();
    }
    
}

// Test
//serpentine_150px_0(0, 0, 0, "N");
//serpentine_150px_0(0, 0, 0, "FN");
//serpentine_150px_0(200, 0, 0, "FS");
//serpentine_150px_0(300, 0, 0, "S");

module serpentine_200px_0(xpos, ypos, zpos, orientation){
    
    // Sub-modules
    module obj(){
        translate([18*px, 18*px, 0])       
        routing(
            dimm = [
                    [[0, 0], [0, 14*px], [0, 10*layer]],
                    [[0, 14*px], [0, 0], [0, 10*layer]]
                    ],
            p0 = [0, 0, 0],
            pf = [
                    ["+yx", [200*px, 25*px], [1, 0]],
                    ["+yx", [-200*px, 25*px], [1, 0]],
                    ["+yx", [200*px, 25*px], [1, 0]],
                    ["+yx", [-200*px, 25*px], [1, 0]],
                    ["+yx", [200*px, 25*px], [1, 0]],
                    ["+yx", [-200*px, 25*px], [1, 0]],
                    ["+yx", [200*px, 25*px], [1, 0]],
                    ["+yx", [-200*px, 25*px+14*px], [1, 0]]
                    ]
        );
        
    }
    
    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-10*25*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -10*25*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-10*25*px - xpos*px, -10*25*px - ypos*px, zpos*layer])
        obj();
    }
    
}

// Test
//serpentine_200px_0(0, 0, 0, "N");
//serpentine_200px_0(0, 0, 0, "FN");
//serpentine_200px_0(0, 0, 0, "FS");
//serpentine_200px_0(0, 0, 0, "S");

module serpentine_300px_0(xpos, ypos, zpos, orientation){
    
    // Sub-modules
    module obj(){
        translate([18*px, 18*px, 0])       
        routing(
            dimm = [
                    [[0, 0], [0, 14*px], [0, 10*layer]],
                    [[0, 14*px], [0, 0], [0, 10*layer]]
                    ],
            p0 = [0, 0, 0],
            pf = [
                    ["+yx", [300*px, 25*px], [1, 0]],
                    ["+yx", [-300*px, 25*px], [1, 0]],
                    ["+yx", [300*px, 25*px], [1, 0]],
                    ["+yx", [-300*px, 25*px], [1, 0]],
                    ["+yx", [300*px, 25*px], [1, 0]],
                    ["+yx", [-300*px, 25*px], [1, 0]],
                    ["+yx", [300*px, 25*px], [1, 0]],
                    ["+yx", [-300*px, 25*px], [1, 0]],
                    ["+yx", [300*px, 25*px], [1, 0]],
                    ["+yx", [-300*px, 25*px], [1, 0]],
                    ["+yx", [300*px, 25*px], [1, 0]],
                    ["+yx", [-300*px, 25*px+14*px], [1, 0]]
                    ]
        );
        
    }
    
    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-14*25*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -14*25*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-14*25*px - xpos*px, -14*25*px - ypos*px, zpos*layer])
        obj();
    }
    
}

// Test
//serpentine_300px_0(0, 0, 0, "N");
//serpentine_300px_0(0, 0, 0, "FN");
//serpentine_300px_0(0, 0, 0, "FS");
//serpentine_300px_0(0, 0, 0, "S");

module diffmix_25px_0(xpos, ypos, zpos, orientation){
      
    // Channel Dimensions
    hchan = 10*layer;
    Wchan = 14*px;

    dim  = [
            [[0,0],[-Wchan/2,Wchan/2],[0,hchan]], // 0
            [[-Wchan/2,Wchan/2],[0,0],[0,hchan]], // 1
                    
           ];
    
    module obj(){
        pi_0 = [-7*px, 25*px, 0];
        pf_0 = [Wchan+11*px, 0, 0];
        connect_0 = [
                     ["+x", pf_0, 0]
                    ];
        routing(pi_0, connect_0, dim);
        
        pi_1 = [-7*px, 0*px, 0];
        pf_1 = [Wchan, 0, 0];
        connect_1 = [
                     ["+x", pf_1, 0]
                    ];
        routing(pi_1, connect_1, dim);

        pi_2 = [18*px, 25*px, 0];
        pf_2 = [Wchan, 0, 0];
        connect_2 = [
                     ["+x", pf_2, 0]
                    ];
        routing(pi_2, connect_2, dim);
  
        pi_3 = [0, 0, 0];
        pf_3 = [35.4*px, 0, 0];
        connect_3 = [
                     ["+x", pf_3, 0]
                    ];
        rotate(45)
        routing(pi_3, connect_3, dim);  
        
    }
    
    if (orientation == "N"){
        translate([25*px + xpos*px, 25*px + ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FN"){
        mirror()
        translate([-2*25*px - xpos*px, 25*px + ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([25*px + xpos*px, -2*25*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror()
        mirror([0, 1, 0])
        translate([-2*25*px - xpos*px, -2*25*px - ypos*px, zpos*layer])
        obj();
    }
    
}

// Test
//diffmix_25px_0(0, 0, "N");
//diffmix_25px_0(0, 0, "FN");
//diffmix_25px_0(0, 0, "FS");
//diffmix_25px_0(0, 0, "S");

module pinhole_325px_0(xpos, ypos, zpos, orientation){
    
    // Parameters
    d_pin   = 140*px;   // ~= 106*layer = 1.06mm;
    l_pin   = 260*px;   // ~= 2.00mm
    h_cone  = 67*px;    // ~= 0.46mm
    
    module obj(){
        rotate([-90, 0, 0]){
            translate([0, 0, l_pin]){
                cylinder(h = h_cone, d1 = d_pin, d2 = 0);
            }
        cylinder(d = d_pin, h = l_pin);
        }
    }
    
    if (orientation == "bottom"){
        translate([xpos*px, ypos*px, zpos*layer + 5 * layer])
        obj();
    }
    
    if (orientation == "left"){
        rotate([0, 0, -90])
        translate([-ypos*px, xpos*px, zpos*layer + 5 * layer])
        obj();
    }
    
    if (orientation == "top"){
        rotate([0, 0, -180])
        translate([-xpos*px, -ypos*px, zpos*layer + 5 * layer])
        obj();
    }
    
    if (orientation == "right"){
        rotate([0, 0, 90])
        translate([ypos*px, -xpos*px, zpos*layer+ 5 * layer])
        obj();
    }

}

// Test
//pinhole_325px_0 (0, -320, 100, "bottom");
//pinhole_325px_0 (-320, 0, 100, "left");
//pinhole_325px_0 (0, 320, 100, "top");
//pinhole_325px_0 (320, 0, 100, "right");

module empty_obj(str_obj){
    
}

////////////////////////// NEEDS FIX /////////////////////////////////////////

module valve_20px_0(xpos, ypos, orientation){
    
    // Parameteres
    h_fluid = 2*layer;
    t_memb = layer;
    h_air = 4*layer;
    h_total = h_fluid + t_memb + h_air;
    d_valve = 20*px;
    
    // Valve connection channels
    xychan0 = 6*px;
    xychan = 8*px;
    hchan = 5*layer;
    wchan = 8*px;

    dimm        =   [  
                        [[0,0],[-wchan/2,wchan/2],[0, hchan]], // 0
                        [[-wchan/2,wchan/2],[0,0],[0, hchan]], // 1
                        [[-xychan/2,xychan/2],[-xychan/2,xychan/2],[0,0]], // 2
                        [[-xychan0/2,xychan0/2],[-xychan0/2,xychan0/2],[0,0]], // 3
                    ];
                    
    overlap_v_xy  = 2*px;
    
    module obj(){
    // Fluid compartment
    color("CadetBlue")
    cylinder(d = d_valve, h = h_fluid);
    
    // Air compartment
    color("SteelBlue")
    translate([0,0,h_fluid + t_memb])
    cylinder(d = d_valve, h = h_air);    
        
    // Fluid in channel connection
    pt_fluid_in         = [0, 0, 0];
    pt_fluid_in_next    = [
                            ["+z", -7*layer, 3],
                          ];
    
    routing(pt_fluid_in,pt_fluid_in_next, dimm);
    
    // Fluid out channel connection
    pt_fluid_out        = [d_valve/2 - overlap_v_xy, 0, 1*layer - hchan];
    pt_fluid_out_next   = [
                            ["+x", 50*px],
                          ];
    
    routing(pt_fluid_out,pt_fluid_out_next, dimm);
    
    // Air control channel connection
    pt_air_control      = [-d_valve/2 - xychan/2 + 6*px, 0, h_total];
    pt_air_control_next = [
                            ["+zx", [10*layer, -50*px]],
                          ];
    
    routing(pt_air_control,pt_air_control_next, dimm);
    
    // Air flushing channel connection
    pt_air_flush        = [d_valve/2 + xychan/2 - 6*px, 0, h_total];
    pt_air_flush_next   = [
                            ["+zy", [10*layer, 50*px], [2,1]],
                          ];
    
    routing(pt_air_flush,pt_air_flush_next, dimm);
    }
    
    if (orientation == "N"){
        translate([68*px + xpos*px, 20*px + ypos*px, 7*layer])
        obj();
    }
    if (orientation == "FN"){
        mirror()
        translate([-68*px - xpos*px, 20*px + ypos*px, 7*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([68*px + xpos*px, -60*px - ypos*px, 7*layer])
        obj();
    }
    if (orientation == "S"){
        mirror()
        mirror([0, 1, 0])
        translate([-68*px - xpos*px, -60*px - ypos*px, 7*layer])
        obj();
    }
    
}

// Test
//valve_20px_0(0, 0, "N");
//valve_20px_0(75, 0, "FN");
//valve_20px_0(150, 0, "FS");
//valve_20px_0(225, 0, "S");

////////////////////////// SCRAP /////////////////////////////////////////

module serpentine_125px_0(xpos, ypos, orientation){
    
    // Sub-modules
    module obj(){
        translate([18*px, 18*px, 0])
        routing(
            dimm = [
                    [[0, 0], [0, 14*px], [0, 10*layer]],
                    [[0, 14*px], [0, 0], [0, 10*layer]]
                    ], 
            p0 = [0, 0, 0], 
            pf = [
                    ["+yx", [125*px, 25*px], [1, 0]],
                    ["+yx", [-125*px, 25*px], [1, 0]],
                    ["+yx", [125*px, 25*px], [1, 0]],
                    ["+yx", [-125*px, 25*px], [1, 0]],
                    ["+yx", [125*px, 25*px+14*px], [1, 0]]
                    ]
        );
        
    }
    
    if (orientation == "N"){
        translate([xpos*px, ypos*px, 0])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-7*25*px - xpos*px, ypos*px, 0])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -7*25*px - ypos*px, 0])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-7*25*px - xpos*px, -7*25*px - ypos*px, 0])
        obj();
    }
    
}

// Test
//serpentine_125px_0(0, 0, "N");
//serpentine_125px_0(0, 0, "FN");
//serpentine_125px_0(-18, -18, "FS");
//serpentine_125px_0(0, 0, "S");

module pump_40px_scrap(xpos, ypos, orientation){
    
    // Parameters
    d_DC = 40*px;       // DC diameter
    t_m_DC = layer;     // DC membrane thickness (2 layers of 5 um in JSON FILE)
    h_f_DC = 3*layer;   // height of the fluid chamber (DC) (2.5 layers in JSON FILE)
    h_c_DC = 6*layer;   // height of control chamber
    d_v = 20*px;        // valves diameter
    t_m_v = layer;      // valves membrane thickness (layer of 5 um in JSON FILE)
    h_f_v = 2*layer;    // height of fluid chamber (valves)
    h_c_v = 4*layer;    // height of control chamber (valves) (3.5 layers in JSON FILE)
    dist_v2v = d_DC + d_v + 20*px; // distance between valves centers
    dist_v2chan = 5*layer; // distance between valves bottom and horizontal connection channel
    
    // Channel Dimensions
    xychan0 = 6*px;  
    hchan = 10*layer;
    wchan = 12*px;
    xychan = 12*px;
    Wchan = 14*px;
    Hchan = 25*layer;
    hchan2 = 10*layer;
    ochan = 70*px;


    dim  = [
            [[0,0],[-Wchan/2,Wchan/2],[0,hchan]], // 0
            [[-Wchan/2,Wchan/2],[0,0],[0,hchan]], // 1
            [[-xychan/2,xychan/2],[-xychan/2,xychan/2],[0,0]], // 2
            [[-xychan0/2,xychan0/2],[-xychan0/2,xychan0/2],[0,0]], // 3
            [[0,0],[-Wchan/2,Wchan/2],[0,Hchan]], // 4
            [[-Wchan/2,Wchan/2],[0,0],[0,Hchan]], // 5
            [[-Wchan/2,Wchan/2],[-Wchan/2,Wchan/2],[0,0]], // 6
            [[0,0],[-Wchan/2,Wchan/2],[hchan-Hchan,hchan]], // 7
            [[-Wchan/2,Wchan/2],[0,0],[hchan-Hchan,hchan]], // 8
            [[0,0],[-Wchan,Wchan],[0,2*Hchan]], // 9
            [[-Wchan/2,3*Wchan/2],[0,0],[0,2*Hchan]], // 10
            [[0,0],[-3*Wchan/2,Wchan/2],[0,2*Hchan]], // 11
            [[-Wchan,Wchan],[0,0],[0,2*Hchan]], // 12
            [[-ochan,ochan],[0,0],[0,Hchan]], // 13
            [[0,0],[-Wchan/2,Wchan/2],[0,hchan2]], // 14
            [[-wchan/2,wchan/2],[0,0],[0,hchan2]], // 15
            [[-wchan/2,wchan/2],[-wchan/2,wchan/2],[0,0]], // 16
            
            
           ];
    
    // Submodules
    module valve(d, h_bot, h_top, t_memb){ 
        /*
        d :         diameter of the valve
        h_bot:      bottom chamber height
        h_top:      top chamber height
        t_memb:     membrane thickness
        */    
        
        // Bottom chamber
        color("SteelBlue")
        cylinder(d = d, h = h_bot, $fn = 100);
        
        // Top chamber
        color("CadetBlue")
        translate([0, 0, h_bot+t_memb])
        cylinder(d = d, h = h_top, $fn = 100);    
    }
    
    module obj(){
        //build DC
        valve(d_DC, h_f_DC, h_c_DC, t_m_DC);
        
        for (j = [0:1]){
            mirror([0, j, 0]){
                translate([0, dist_v2v/2, 0])
                
                // inlet and outlet 20 px valves
                valve(d_v, h_f_v, h_c_v, t_m_v);
                
                // fluid connection between valves and DC
                pi_0 = [0 , d_DC/2 - xychan/2, 0];
                pf_0 = [0, dist_v2v/2, 0];
                connect_0 = [
                             ["+z", -(dist_v2chan+hchan)],
                             ["yz", pf_0, [15,3]]
                            ];
                routing(pi_0, connect_0, dim);
            }
            
        }
        pi_1_0 = [0, 40*px, 7*layer];
        connect_1_0 = [["+x", -38.4*px, 0]];
        color("Red")
        routing(pi_1_0, connect_1_0, dim);
        
        pi_1_1 = [0, 40*px, 7*layer];
        connect_1_1 = [["+x", 38.4*px, 0]];
        color("Blue")
        routing(pi_1_1, connect_1_1, dim);
        
        pi_2 = [-38.4*px, -40*px, 7*layer];
        connect_2 = [["+x", 76.8*px, 0]];
        routing(pi_2, connect_2, dim);
        
        pi_3 = [-38.4*px, 0, 10*layer];
        connect_3 = [["+x", 76.8*px, 0]];
        routing(pi_3, connect_3, dim);
        
        pi_4 = [0, 49*px, -9*layer];
        connect_4 = [["+y", 11*px, 1]];
        routing(pi_4, connect_4, dim);
        
        pi_5 = [0, -60*px, -9*layer];
        connect_5 = [["+y", 11*px, 1]];
        routing(pi_5, connect_5, dim);
    }
    
    if (orientation == "N"){
        translate([40*px + xpos*px, 70*px + ypos*px, 15*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror()
        translate([-40*px - xpos*px, 70*px + ypos*px, 15*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([40*px + xpos*px, -70*px - ypos*px, 15*layer])
        obj();
    }
    if (orientation == "S"){
        mirror()
        mirror([0, 1, 0])
        translate([-40*px - xpos*px, -70*px - ypos*px, 15*layer])
        obj();
    }
    
}

module pinhole_300px_scrap(xpos, ypos, orientation){
    
    // Parameters
    d_pin   = 140*px;   // ~= 106*layer = 1.06mm;
    l_pin   = 260*px;   // ~= 2.00mm
    h_cone  = 60*px;    // ~= 0.46mm
    
    // Pin connection channels
    XYchan  = 14*px;
    Hchan   = 10*layer;
    Wchan   = 14*px;
    
    dimm    =   [    
                    [[0,0],[-Wchan/2,Wchan/2],[0, Hchan]], // 0
                    [[-Wchan/2,Wchan/2],[0,0],[0, Hchan]], // 1
                    [[-XYchan/2,XYchan/2],[-XYchan/2,XYchan/2],[0,0]], // 2
                ];

    module obj(){
        rotate([-90, 0, 0]){
        //translate([0, 0, XYchan])
            translate([0, 0, l_pin]){
                cylinder(h = h_cone, d1 = d_pin, d2 = 0);
            }
        cylinder(d = d_pin, h = l_pin);
        }
        //routing([0, 0, 0], [["+y", XYchan, 1]], dimm); 
    }
    
    if (orientation == "N"){
        //translate([68.5*px + xpos*px, ypos*px, 68.5*px])
        obj();
    }

}