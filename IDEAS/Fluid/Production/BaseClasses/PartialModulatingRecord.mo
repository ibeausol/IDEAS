within IDEAS.Fluid.Production.BaseClasses;
partial record PartialModulatingRecord
  import IDEAS;
  extends IDEAS.Fluid.Production.BaseClasses.PartialRecord;

  parameter Real modulationStart=30;
  parameter Real modulationMin=20;

  parameter Boolean efficiencyData=true;
  parameter Boolean copData=false;

  parameter Real[:,:,:] heat = {[[0]]};
  parameter Real[:,:,:] power = {[[0]]};
  parameter Real[:,:,:] cop = {[[0]]};

  parameter Integer n(min=2);
  parameter Real[n] modulationVector;

end PartialModulatingRecord;
