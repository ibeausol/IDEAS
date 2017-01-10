within IDEAS.Examples.TwinHouses.BaseClasses.Structures;
model TwinhouseO5 "Model Based on Excel autogenerated"
    extends IDEAS.Templates.Interfaces.BaseClasses.Structure(
    redeclare each package Medium = IDEAS.Media.Air,
        nZones = 7,
        VZones = {Living.V,Corridor.V,Bathroom.V,Bedroom1.V,Kitchen.V,Entrance.V,Bedroom2.V},
        AZones = {Living.V/3,Corridor.V/3,Bathroom.V/3,Bedroom1.V/3,Kitchen.V/3,Entrance.V/3,Bedroom2.V/3},
        Q_design = {Living.Q_design,Corridor.Q_design,Bathroom.Q_design,Bedroom1.Q_design,Kitchen.Q_design,Entrance.Q_design,Bedroom2.Q_design},
        nEmb = 0);
 parameter Modelica.SIunits.Angle incWall =  IDEAS.Types.Tilt.Wall;
 parameter Modelica.SIunits.Angle incCeil =  IDEAS.Types.Tilt.Ceiling;
 parameter Modelica.SIunits.Angle incFloor = IDEAS.Types.Tilt.Floor;
 parameter Modelica.SIunits.Angle aziNorth = IDEAS.Types.Azimuth.N;
 parameter Modelica.SIunits.Angle aziEast = IDEAS.Types.Azimuth.E;
 parameter Modelica.SIunits.Angle aziSouth = IDEAS.Types.Azimuth.S;
 parameter Modelica.SIunits.Angle aziWest = IDEAS.Types.Azimuth.W;

 // Declaration of zones
IDEAS.Buildings.Components.Zone Living(nSurf=17,
V=82.435299,
 n50=2.2,
 fRH=22,
 allowFlowReversal=false,
redeclare package Medium = Medium,
    redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
        mSenFac=1))               annotation (Placement(transformation(extent={{-108,51},
            {-89,76}})));

IDEAS.Buildings.Components.Zone Corridor(nSurf=10,
V=13.66761,
 n50=2.2,
 fRH=22,
 allowFlowReversal=false,
redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
        mSenFac=1))               annotation (Placement(transformation(extent={{-78,51},
            {-58,76}})));

IDEAS.Buildings.Components.Zone Bathroom(nSurf=8,
V=17.2656495,
 n50=2.2,
 fRH=22,
 allowFlowReversal=false,
redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
        mSenFac=1))               annotation (Placement(transformation(extent={{-48,51},
            {-28,76}})));

IDEAS.Buildings.Components.Zone Bedroom1(nSurf=11,
V=27.880128,
 n50=2.2,
 fRH=22,
 allowFlowReversal=false,
redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
        mSenFac=1))               annotation (Placement(transformation(extent={{-18,51},
            {2,76}})));

IDEAS.Buildings.Components.Zone Kitchen(nSurf=10,
V=18.5700355,
 n50=1.62,
 fRH=22,
 allowFlowReversal=false,
redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
        mSenFac=1))               annotation (Placement(transformation(extent={{12,51},
            {32,76}})));

IDEAS.Buildings.Components.Zone Entrance(nSurf=8,
V=14.567307,
 n50=1.62,
 fRH=22,
 allowFlowReversal=false,
redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
        mSenFac=1))               annotation (Placement(transformation(extent={{42,51},
            {62,76}})));

IDEAS.Buildings.Components.Zone Bedroom2(nSurf=11,
V=27.8549285,
 n50=1.62,
 fRH=22,
 allowFlowReversal=false,
redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
        mSenFac=1))               annotation (Placement(transformation(extent={{72,51},
            {92,76}})));

// Declaration of walls
IDEAS.Buildings.Components.OuterWall W1(AWall=8.978,inc=incWall,azi=aziNorth,
redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                   constructionType)
                          annotation (Placement(transformation(extent={{-145,34},
            {-135,14}})));
IDEAS.Buildings.Components.OuterWall W2(AWall=7.954,inc=incWall,azi=aziNorth,
redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                   constructionType)
                          annotation (Placement(transformation(extent={{-130,34},
            {-120,14}})));
IDEAS.Buildings.Components.OuterWall W3(AWall=12.6352,inc=incWall,azi=aziNorth,
redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                   constructionType)
                          annotation (Placement(transformation(extent={{-115,34},
            {-105,14}})));
IDEAS.Buildings.Components.OuterWall W4(AWall=11.2176,inc=incWall,azi=aziEast,
redeclare parameter BaseClasses.Data.Constructions.extwall_E
                                                 constructionType)
                          annotation (Placement(transformation(extent={{-100,34},
            {-90,14}})));
IDEAS.Buildings.Components.OuterWall W5(AWall=11.2832,inc=incWall,azi=aziEast,
redeclare parameter BaseClasses.Data.Constructions.extwall_E
                                                 constructionType)
                          annotation (Placement(transformation(extent={{-85,34},
            {-75,14}})));
IDEAS.Buildings.Components.OuterWall W6(AWall=11.2504,inc=incWall,azi=aziEast,
redeclare parameter BaseClasses.Data.Constructions.extwall_E
                                                 constructionType)
                          annotation (Placement(transformation(extent={{-70,34},
            {-60,14}})));
IDEAS.Buildings.Components.OuterWall W7(AWall=13.5224,inc=incWall,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                   constructionType)
                          annotation (Placement(transformation(extent={{-55,34},
            {-45,14}})));
IDEAS.Buildings.Components.OuterWall W8(AWall=14.562,inc=incWall,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                   constructionType)
                          annotation (Placement(transformation(extent={{-40,34},
            {-30,14}})));
IDEAS.Buildings.Components.OuterWall W9(AWall=16.44592,inc=incWall,azi=aziWest,
redeclare parameter BaseClasses.Data.Constructions.extwall_Ws
                                                  constructionType)
                          annotation (Placement(transformation(extent={{-25,34},
            {-15,14}})));
IDEAS.Buildings.Components.OuterWall W10(AWall=6.6748,inc=incWall,azi=aziWest,
redeclare parameter BaseClasses.Data.Constructions.extwall_Wn
                                                  constructionType)
                          annotation (Placement(transformation(extent={{-5,34},
            {5,14}})));
IDEAS.Buildings.Components.OuterWall W11(AWall=10.64688,inc=incWall,azi=aziWest,
redeclare parameter BaseClasses.Data.Constructions.extwall_Wn
                                                  constructionType)
                          annotation (Placement(transformation(extent={{10,34},
            {20,14}})));
IDEAS.Buildings.Components.BoundaryWall W12(AWall=10.87075,inc=incFloor,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.ground
                                              constructionType,
use_T_in = true) annotation (Placement(transformation(extent={{25,34},{35,14}})));
IDEAS.Buildings.Components.BoundaryWall W13(AWall=10.87075,inc=incCeil,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.ceiling
                                               constructionType,
use_T_in = true) annotation (Placement(transformation(extent={{40,34},{50,14}})));
IDEAS.Buildings.Components.BoundaryWall W14(AWall=7.869125,inc=incFloor,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.ground
                                              constructionType,
use_T_in = true) annotation (Placement(transformation(extent={{55,34},{65,14}})));
IDEAS.Buildings.Components.BoundaryWall W15(AWall=7.869125,inc=incCeil,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.ceiling
                                               constructionType,
use_T_in = true) annotation (Placement(transformation(extent={{70,34},{80,14}})));
IDEAS.Buildings.Components.BoundaryWall W16(AWall=15.2703,inc=incFloor,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.ground
                                              constructionType,
use_T_in = true) annotation (Placement(transformation(extent={{85,34},{95,14}})));
IDEAS.Buildings.Components.BoundaryWall W17(AWall=15.2703,inc=incCeil,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.ceiling
                                               constructionType,
use_T_in = true) annotation (Placement(transformation(extent={{100,34},{110,14}})));
IDEAS.Buildings.Components.BoundaryWall W18(AWall=40.800375,inc=incFloor,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.ground
                                              constructionType,
use_T_in = true) annotation (Placement(transformation(extent={{115,34},{125,14}})));
IDEAS.Buildings.Components.BoundaryWall W19(AWall=40.800375,inc=incCeil,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.ceiling
                                               constructionType,
use_T_in = true) annotation (Placement(transformation(extent={{-145,6},{-135,-14}})));
IDEAS.Buildings.Components.BoundaryWall W20(AWall=6.4156,inc=incFloor,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.ground
                                              constructionType,
use_T_in = true) annotation (Placement(transformation(extent={{-130,6},{-120,-14}})));
IDEAS.Buildings.Components.BoundaryWall W21(AWall=6.4156,inc=incCeil,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.ceiling
                                               constructionType,
use_T_in = true) annotation (Placement(transformation(extent={{-115,6},{-105,-14}})));
IDEAS.Buildings.Components.BoundaryWall W22(AWall=8.944,inc=incFloor,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.ground
                                              constructionType,
use_T_in = true) annotation (Placement(transformation(extent={{-100,6},{-90,-14}})));
IDEAS.Buildings.Components.BoundaryWall W23(AWall=8.944,inc=incCeil,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.ceiling
                                               constructionType,
use_T_in = true) annotation (Placement(transformation(extent={{-85,6},{-75,-14}})));
IDEAS.Buildings.Components.BoundaryWall W24(AWall=15.28065,inc=incFloor,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.ground
                                              constructionType,
use_T_in = true) annotation (Placement(transformation(extent={{-70,6},{-60,-14}})));
IDEAS.Buildings.Components.BoundaryWall W25(AWall=15.28065,inc=incCeil,azi=aziSouth,
redeclare parameter BaseClasses.Data.Constructions.ceiling
                                               constructionType,
use_T_in = true) annotation (Placement(transformation(extent={{-55,6},{-45,-14}})));
IDEAS.Buildings.Components.OuterWall W26(redeclare parameter BaseClasses.Data.Constructions.door_ext
                                                                                         constructionType,
AWall=2.014875,inc=incWall,azi = aziNorth)
                                    annotation (Placement(transformation(extent={{-40,6},
            {-30,-14}})));
  IDEAS.Buildings.Components.Window W27(
    A=2.1402,
    inc=incWall,
    azi=aziNorth,
    windowDynamicsType=IDEAS.Buildings.Components.Examples.Interfaces.WindowDynamicsType.Two,

    redeclare BaseClasses.Data.Constructions.PvcInsulated fraType,
    redeclare BaseClasses.Data.Materials.Glazing glazing,
    frac=0.397,
    redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=
          0.05, len=4.62),
    redeclare Buildings.Components.Shading.Box shaType(
      hWin=1.3,
      wWin=1,
      wLeft=0.07,
      wRight=0.07,
      ovDep=0.15,
      ovGap=0.07,
      hFin=0.07,
      finDep=0.15,
      finGap=0.07))
    annotation (Placement(transformation(extent={{-25,6},{-15,-14}})));

  IDEAS.Buildings.Components.Window W28(
    windowDynamicsType=IDEAS.Buildings.Components.Examples.Interfaces.WindowDynamicsType.Two,

    redeclare BaseClasses.Data.Constructions.PvcInsulated fraType,
    redeclare BaseClasses.Data.Materials.Glazing glazing,
    A=2.1402,
    inc=incWall,
    azi=aziEast,
    frac=0.397,
    redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=
          0.05, len=4.62),
    redeclare Buildings.Components.Shading.Box shaType(
      hWin=1.3,
      wWin=1,
      wLeft=0.07,
      wRight=0.07,
      ovDep=0.15,
      ovGap=0.07,
      hFin=0.07,
      finDep=0.15,
      finGap=0.07))
    annotation (Placement(transformation(extent={{-12,6},{-2,-14}})));

  IDEAS.Buildings.Components.Window W29(
    windowDynamicsType=IDEAS.Buildings.Components.Examples.Interfaces.WindowDynamicsType.Two,

    redeclare BaseClasses.Data.Constructions.PvcInsulated fraType,
    redeclare BaseClasses.Data.Materials.Glazing glazing,
    A=2.1402,
    inc=incWall,
    azi=aziSouth,
    frac=0.397,
    redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=
          0.05, len=4.62),
    redeclare Buildings.Components.Shading.Interfaces.DoubleShading shaType(
        redeclare Buildings.Components.Shading.Box stateShading2(
        hWin=1.3,
        wWin=1,
        wLeft=0.07,
        wRight=0.07,
        ovDep=0.15,
        ovGap=0.07,
        hFin=0.07,
        finDep=0.15,
        finGap=0.07), redeclare Buildings.Components.Shading.Screen
        stateShading1(shaCorr=0.05)))
    annotation (Placement(transformation(extent={{5,6},{15,-14}})));

  IDEAS.Buildings.Components.Window W30(
    windowDynamicsType=IDEAS.Buildings.Components.Examples.Interfaces.WindowDynamicsType.Two,

    redeclare BaseClasses.Data.Constructions.PvcInsulated fraType,
    redeclare BaseClasses.Data.Materials.Glazing glazing,
    A=2.8527,
    inc=incWall,
    azi=aziSouth,
    frac=0.354,
    redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=
          0.05, len=6.04),
    redeclare Buildings.Components.Shading.Interfaces.DoubleShading shaType(
        redeclare Buildings.Components.Shading.Box stateShading2(
        hWin=1.3,
        wWin=1,
        wLeft=0.07,
        wRight=0.07,
        ovDep=0.15,
        ovGap=0.07,
        hFin=0.07,
        finDep=0.15,
        finGap=0.07), redeclare Buildings.Components.Shading.Screen
        stateShading1(shaCorr=0.05)))
    annotation (Placement(transformation(extent={{20,4},{30,-16}})));

  IDEAS.Buildings.Components.Window W31(
    windowDynamicsType=IDEAS.Buildings.Components.Examples.Interfaces.WindowDynamicsType.Two,

    redeclare BaseClasses.Data.Constructions.PvcInsulated fraType,
    redeclare BaseClasses.Data.Materials.Glazing glazing,
    A=5.8116,
    inc=incWall,
    azi=aziSouth,
    frac=0.293,
    redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=
          0.05, len=14.4),
    redeclare Buildings.Components.Shading.Interfaces.DoubleShading shaType(
        redeclare Buildings.Components.Shading.Box stateShading2(
        hWin=1.3,
        wWin=1,
        wLeft=0.07,
        wRight=0.07,
        ovDep=0.15,
        ovGap=0.07,
        hFin=0.07,
        finDep=0.15,
        finGap=0.07), redeclare Buildings.Components.Shading.Screen
        stateShading1(shaCorr=0.05)))
    annotation (Placement(transformation(extent={{35,6},{45,-14}})));

  IDEAS.Buildings.Components.Window W32(
    windowDynamicsType=IDEAS.Buildings.Components.Examples.Interfaces.WindowDynamicsType.Two,

    redeclare BaseClasses.Data.Constructions.PvcInsulated fraType,
    redeclare BaseClasses.Data.Materials.Glazing glazing,
    A=2.1402,
    inc=incWall,
    azi=aziWest,
    frac=0.397,
    redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=
          0.05, len=4.62),
    redeclare Buildings.Components.Shading.Box shaType(
      hWin=1.31,
      wWin=1,
      wLeft=0.1,
      wRight=0.1,
      ovDep=0.15,
      ovGap=0.1,
      hFin=0.1,
      finDep=0.15,
      finGap=0.1))
    annotation (Placement(transformation(extent={{50,6},{60,-14}})));

  IDEAS.Buildings.Components.Window W33(
    windowDynamicsType=IDEAS.Buildings.Components.Examples.Interfaces.WindowDynamicsType.Two,

    redeclare BaseClasses.Data.Constructions.PvcInsulated fraType,
    redeclare BaseClasses.Data.Materials.Glazing glazing,
    A=2.1402,
    inc=incWall,
    azi=aziWest,
    frac=0.397,
    redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=
          0.05, len=4.62),
    redeclare Buildings.Components.Shading.Box shaType(
      hWin=1.31,
      wWin=1,
      wLeft=0.1,
      wRight=0.1,
      ovDep=0.15,
      ovGap=0.1,
      hFin=0.1,
      finDep=0.15,
      finGap=0.1))
    annotation (Placement(transformation(extent={{63,6},{73,-14}})));

IDEAS.Buildings.Components.InternalWall W34(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                             constructionType,
AWall=11.0864,inc=incWall,azi = 90)
                                   annotation (Placement(transformation(extent={{80,6},{
            90,-14}})));
IDEAS.Buildings.Components.InternalWall W35(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                             constructionType,
AWall=11.0864,inc=incWall,azi = 90)
                                   annotation (Placement(transformation(extent={{95,6},{
            105,-14}})));
IDEAS.Buildings.Components.InternalWall W36(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                             constructionType,
AWall=11.0536,inc=incWall,azi = 90)
                                   annotation (Placement(transformation(extent={{110,6},
            {120,-14}})));
IDEAS.Buildings.Components.InternalWall W37(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                             constructionType,
AWall=7.954,inc=incWall,azi = 90) annotation (Placement(transformation(extent={{-145,
            -22},{-135,-42}})));
IDEAS.Buildings.Components.InternalWall W38(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                             constructionType,
AWall=6.1172,inc=incWall,azi = 90)
                                  annotation (Placement(transformation(extent={{-130,
            -22},{-120,-42}})));
IDEAS.Buildings.Components.InternalWall W39(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                             constructionType,
AWall=8.528,inc=incWall,azi = 90) annotation (Placement(transformation(extent={{-115,
            -22},{-105,-42}})));
IDEAS.Buildings.Components.InternalWall W40(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                             constructionType,
AWall=11.0536,inc=incWall,azi = 90)
                                   annotation (Placement(transformation(extent={{-100,
            -22},{-90,-42}})));
IDEAS.Buildings.Components.InternalWall W41(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                             constructionType,
AWall=11.0536,inc=incWall,azi = 90)
                                   annotation (Placement(transformation(extent={{-85,-22},
            {-75,-42}})));
IDEAS.Buildings.Components.InternalWall W42(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                             constructionType,
AWall=6.1172,inc=incWall,azi = 90)
                                  annotation (Placement(transformation(extent={{-70,-22},
            {-60,-42}})));
IDEAS.Buildings.Components.InternalWall W43(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                             constructionType,
AWall=8.528,inc=incWall,azi = 90) annotation (Placement(transformation(extent={{-55,-22},
            {-45,-42}})));
IDEAS.Buildings.Components.InternalWall W44(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                             constructionType,
AWall=11.2504,inc=incWall,azi = 90)
                                   annotation (Placement(transformation(extent={{-40,-22},
            {-30,-42}})));
IDEAS.Buildings.Components.InternalWall W45(redeclare parameter BaseClasses.Data.Constructions.door_int
                                                                                            constructionType,
AWall=1.893375,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{-25,-22},
            {-15,-42}})));
IDEAS.Buildings.Components.InternalWall W46(redeclare parameter BaseClasses.Data.Constructions.door_int
                                                                                            constructionType,
AWall=1.893375,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{-10,-22},
            {0,-42}})));
IDEAS.Buildings.Components.InternalWall W47(redeclare parameter BaseClasses.Data.Constructions.door_int
                                                                                            constructionType,
AWall=1.893375,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{5,-22},
            {15,-42}})));
IDEAS.Buildings.Components.InternalWall W48(redeclare parameter BaseClasses.Data.Constructions.door_open
                                                                                             constructionType,
AWall=1.893375,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{20,-22},
            {30,-42}})));
IDEAS.Buildings.Components.InternalWall W49(redeclare parameter BaseClasses.Data.Constructions.door_open
                                                                                             constructionType,
AWall=1.893375,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{35,-22},
            {45,-42}})));
IDEAS.Buildings.Components.InternalWall W50(redeclare parameter BaseClasses.Data.Constructions.door_open
                                                                                             constructionType,
AWall=1.893375,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{50,-22},
            {60,-42}})));
IDEAS.Buildings.Components.InternalWall W51(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                          constructionType,
AWall=6.56,inc=incWall,azi = 90)
                                annotation (Placement(transformation(extent={{65,-22},
            {75,-42}})));
IDEAS.Buildings.Components.InternalWall W52(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                          constructionType,
AWall=6.56,inc=incWall,azi = 90)
                                annotation (Placement(transformation(extent={{80,-22},
            {90,-42}})));
IDEAS.Buildings.Components.InternalWall W53(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                          constructionType,
AWall=6.56,inc=incWall,azi = 90)
                                annotation (Placement(transformation(extent={{95,-22},
            {105,-42}})));
IDEAS.Buildings.Components.InternalWall W54(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                          constructionType,
AWall=6.56,inc=incWall,azi = 90)
                                annotation (Placement(transformation(extent={{110,-22},
            {120,-42}})));

            // input for temperatures of attic and basement
    Modelica.Blocks.Tables.CombiTable1Ds   inputAtticAndBasement(
    table=[0.0,0.0,0.0; 1000,1,1],
    smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
    tableOnFile=true,
    tableName="data",
    fileName=IDEAS.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath(Modelica.Utilities.Files.loadResource("modelica://IDEAS") + "/Inputs/"+ "bc_TTH_N2.txt"),
    columns={2,3})
      annotation (Placement(transformation(extent={{-120,-86},{-100,-66}})));
  Modelica.Blocks.Math.UnitConversions.From_degC[2] from_degC
    annotation (Placement(transformation(extent={{-84,-86},{-64,-66}})));
    controlBlind controlblinds
      annotation (Placement(transformation(extent={{-30,-76},{-10,-56}})));
equation
connect(Kitchen.propsBus[1],W1.propsBus_a);
connect(Entrance.propsBus[1],W2.propsBus_a);
connect(Bedroom2.propsBus[1],W3.propsBus_a);
connect(Bedroom2.propsBus[2],W4.propsBus_a);
connect(Bathroom.propsBus[1],W5.propsBus_a);
connect(Bedroom1.propsBus[1],W6.propsBus_a);
connect(Bedroom1.propsBus[2],W7.propsBus_a);
connect(Living.propsBus[1],W8.propsBus_a);
connect(Living.propsBus[2],W9.propsBus_a);
connect(Living.propsBus[3],W10.propsBus_a);
connect(Kitchen.propsBus[2],W11.propsBus_a);
connect(Kitchen.propsBus[3],W12.propsBus_a);
connect(Kitchen.propsBus[4],W13.propsBus_a);
connect(Entrance.propsBus[2],W14.propsBus_a);
connect(Entrance.propsBus[3],W15.propsBus_a);
connect(Bedroom2.propsBus[3],W16.propsBus_a);
connect(Bedroom2.propsBus[4],W17.propsBus_a);
connect(Living.propsBus[4],W18.propsBus_a);
connect(Living.propsBus[5],W19.propsBus_a);
connect(Corridor.propsBus[1],W20.propsBus_a);
connect(Corridor.propsBus[2],W21.propsBus_a);
connect(Bathroom.propsBus[2],W22.propsBus_a);
connect(Bathroom.propsBus[3],W23.propsBus_a);
connect(Bedroom1.propsBus[3],W24.propsBus_a);
connect(Bedroom1.propsBus[4],W25.propsBus_a);
connect(Entrance.propsBus[4],W26.propsBus_a);
connect(Bedroom2.propsBus[5],W27.propsBus_a);
connect(Bathroom.propsBus[4],W28.propsBus_a);
connect(Bedroom1.propsBus[5],W29.propsBus_a);
connect(Living.propsBus[6],W30.propsBus_a);
connect(Living.propsBus[7],W31.propsBus_a);
connect(Living.propsBus[8],W32.propsBus_a);
connect(Kitchen.propsBus[5],W33.propsBus_a);
connect(Entrance.propsBus[5],W34.propsBus_a);
connect(Kitchen.propsBus[6],W34.propsBus_b);
connect(Bedroom2.propsBus[6],W35.propsBus_a);
connect(Entrance.propsBus[6],W35.propsBus_b);
connect(Living.propsBus[9],W36.propsBus_a);
connect(Kitchen.propsBus[7],W36.propsBus_b);
connect(Living.propsBus[10],W37.propsBus_a);
connect(Entrance.propsBus[7],W37.propsBus_b);
connect(Corridor.propsBus[3],W38.propsBus_a);
connect(Bedroom2.propsBus[7],W38.propsBus_b);
connect(Bathroom.propsBus[5],W39.propsBus_a);
connect(Bedroom2.propsBus[8],W39.propsBus_b);
connect(Corridor.propsBus[4],W40.propsBus_a);
connect(Living.propsBus[11],W40.propsBus_b);
connect(Bathroom.propsBus[6],W41.propsBus_a);
connect(Corridor.propsBus[5],W41.propsBus_b);
connect(Bedroom1.propsBus[6],W42.propsBus_a);
connect(Corridor.propsBus[6],W42.propsBus_b);
connect(Bedroom1.propsBus[7],W43.propsBus_a);
connect(Bathroom.propsBus[7],W43.propsBus_b);
connect(Bedroom1.propsBus[8],W44.propsBus_a);
connect(Living.propsBus[12],W44.propsBus_b);
connect(Living.propsBus[13],W45.propsBus_a);
connect(Kitchen.propsBus[8],W45.propsBus_b);
connect(Living.propsBus[14],W46.propsBus_a);
connect(Entrance.propsBus[8],W46.propsBus_b);
connect(Corridor.propsBus[7],W47.propsBus_a);
connect(Bedroom2.propsBus[9],W47.propsBus_b);
connect(Corridor.propsBus[8],W48.propsBus_a);
connect(Living.propsBus[15],W48.propsBus_b);
connect(Bedroom1.propsBus[9],W49.propsBus_a);
connect(Corridor.propsBus[9],W49.propsBus_b);
connect(Bathroom.propsBus[8],W50.propsBus_a);
connect(Corridor.propsBus[10],W50.propsBus_b);
connect(Kitchen.propsBus[9],W51.propsBus_a);
connect(Kitchen.propsBus[10],W51.propsBus_b);
connect(Bedroom2.propsBus[10],W52.propsBus_a);
connect(Bedroom2.propsBus[11],W52.propsBus_b);
connect(Living.propsBus[16],W53.propsBus_a);
connect(Living.propsBus[17],W53.propsBus_b);
connect(Bedroom1.propsBus[10],W54.propsBus_a);
connect(Bedroom1.propsBus[11],W54.propsBus_b);

connect(Living.gainCon.T, TSensor[1]);
connect(Living.flowPort_In, flowPort_In[1]);
connect(Living.flowPort_Out, flowPort_Out[1]);
connect(Living.gainCon, heatPortCon[1]);
connect(Living.gainRad, heatPortRad[1]);

connect(Corridor.gainCon.T, TSensor[2]);
connect(Corridor.flowPort_In, flowPort_In[2]);
connect(Corridor.flowPort_Out, flowPort_Out[2]);
connect(Corridor.gainCon, heatPortCon[2]);
connect(Corridor.gainRad, heatPortRad[2]);

connect(Bathroom.gainCon.T, TSensor[3]);
connect(Bathroom.flowPort_In, flowPort_In[3]);
connect(Bathroom.flowPort_Out, flowPort_Out[3]);
connect(Bathroom.gainCon, heatPortCon[3]);
connect(Bathroom.gainRad, heatPortRad[3]);

connect(Bedroom1.gainCon.T, TSensor[4]);
connect(Bedroom1.flowPort_In, flowPort_In[4]);
connect(Bedroom1.flowPort_Out, flowPort_Out[4]);
connect(Bedroom1.gainCon, heatPortCon[4]);
connect(Bedroom1.gainRad, heatPortRad[4]);

connect(Kitchen.gainCon.T, TSensor[5]);
connect(Kitchen.flowPort_In, flowPort_In[5]);
connect(Kitchen.flowPort_Out, flowPort_Out[5]);
connect(Kitchen.gainCon, heatPortCon[5]);
connect(Kitchen.gainRad, heatPortRad[5]);

connect(Entrance.gainCon.T, TSensor[6]);
connect(Entrance.flowPort_In, flowPort_In[6]);
connect(Entrance.flowPort_Out, flowPort_Out[6]);
connect(Entrance.gainCon, heatPortCon[6]);
connect(Entrance.gainRad, heatPortRad[6]);

connect(Bedroom2.gainCon.T, TSensor[7]);
connect(Bedroom2.flowPort_In, flowPort_In[7]);
connect(Bedroom2.flowPort_Out, flowPort_Out[7]);
connect(Bedroom2.gainCon, heatPortCon[7]);
connect(Bedroom2.gainRad, heatPortRad[7]);

connect(W12.T,from_degC[2].y);
connect(W13.T,from_degC[1].y);
connect(W14.T,from_degC[2].y);
connect(W15.T,from_degC[1].y);
connect(W16.T,from_degC[2].y);
connect(W17.T,from_degC[1].y);
connect(W18.T,from_degC[2].y);
connect(W19.T,from_degC[1].y);
connect(W20.T,from_degC[2].y);
connect(W21.T,from_degC[1].y);
connect(W22.T,from_degC[2].y);
connect(W23.T,from_degC[1].y);
connect(W24.T,from_degC[2].y);
connect(W25.T,from_degC[1].y);

 if time> 20044800 then
  inputAtticAndBasement.u= sim.timMan.timCal;
  else
  inputAtticAndBasement.u = 20044800;
 end if;

  controlblinds.y= W29.Ctrl;
  controlblinds.y= W30.Ctrl;
  controlblinds.y= W31.Ctrl;
  connect(inputAtticAndBasement.y, from_degC.u) annotation (Line(points={{-99,
          -76},{-92.5,-76},{-86,-76}}, color={0,0,127}));
end TwinhouseO5;
