import Foundation

/**
 Supported OBD2 sensors list
 For detailed information read https://en.wikipedia.org/wiki/OBD-II_PIDs
 */

enum OBD2Sensor: UInt8 {
    case Supported01_20 = 0x00
    case MonitorStatusSinceDTCsCleared = 0x01
    case FreezeFrameStatus = 0x02
    case FuelSystemStatus = 0x03
    case CalculatedEngineLoadValue = 0x04
    case EngineCoolantTemperature = 0x05
    case ShorttermfueltrimBank1 = 0x06
    case LongtermfueltrimBank1 = 0x07
    case ShorttermfueltrimBank2 = 0x08
    case LongtermfueltrimBank2 = 0x09
    case FuelPressure = 0x0a
    case IntakeManifoldPressure = 0x0b
    case EngineRPM = 0x0c
    case VehicleSpeed = 0x0d
    case TimingAdvance = 0x0e
    case IntakeAirTemperature = 0x0f
    case MassAirFlow = 0x10
    case ThrottlePosition = 0x11
    case SecondaryAirStatus = 0x12
    case OxygenSensorsPresent = 0x13
    case OxygenVoltageBank1Sensor1 = 0x14
    case OxygenVoltageBank1Sensor2 = 0x15
    case OxygenVoltageBank1Sensor3 = 0x16
    case OxygenVoltageBank1Sensor4 = 0x17
    case OxygenVoltageBank2Sensor1 = 0x18
    case OxygenVoltageBank2Sensor2 = 0x19
    case OxygenVoltageBank2Sensor3 = 0x1a
    case OxygenVoltageBank2Sensor4 = 0x1b
    case OBDStandardsThisVehicleConforms = 0x1c
    case OxygenSensorsPresent2 = 0x1d
    case AuxiliaryInputStatus = 0x1e
    case RunTimeSinceEngineStart = 0x1f
    case PIDsSupported21_40 = 0x20
    case DistanceTraveledWithMalfunctionIndicatorLampOn = 0x21
    case FuelRailPressureManifoldVacuum = 0x22
    case FuelRailPressureDiesel = 0x23
    case EquivalenceRatioVoltageO2S1 = 0x24
    case EquivalenceRatioVoltageO2S2 = 0x25
    case EquivalenceRatioVoltageO2S3 = 0x26
    case EquivalenceRatioVoltageO2S4 = 0x27
    case EquivalenceRatioVoltageO2S5 = 0x28
    case EquivalenceRatioVoltageO2S6 = 0x29
    case EquivalenceRatioVoltageO2S7 = 0x2a
    case EquivalenceRatioVoltageO2S8 = 0x2b
    case CommandedEGR = 0x2c
    case EGRError = 0x2d
    case CommandedEvaporativePurge = 0x2e
    case FuelLevelInput = 0x2f
    case NumberofWarmUpsSinceCodesCleared = 0x30
    case DistanceTraveledSinceCodesCleared = 0x31
    case EvaporativeSystemVaporPressure = 0x32
    case BarometricPressure = 0x33
    case EquivalenceRatioCurrentO2S1 = 0x34
    case EquivalenceRatioCurrentO2S2 = 0x35
    case EquivalenceRatioCurrentO2S3 = 0x36
    case EquivalenceRatioCurrentO2S4 = 0x37
    case EquivalenceRatioCurrentO2S5 = 0x38
    case EquivalenceRatioCurrentO2S6 = 0x39
    case EquivalenceRatioCurrentO2S7 = 0x3a
    case EquivalenceRatioCurrentO2S8 = 0x3b
    case CatalystTemperatureBank1Sensor1 = 0x3c
    case CatalystTemperatureBank2Sensor1 = 0x3d
    case CatalystTemperatureBank1Sensor2 = 0x3e
    case CatalystTemperatureBank2Sensor2 = 0x3f
    case PIDsSupported41_60 = 0x40
    case MonitorStatusThisDriveCycle = 0x41
    case ControlModuleVoltage = 0x42
    case AbsoluteLoadValue = 0x43
    case CommandEquivalenceRatio = 0x44
    case RelativeThrottlePosition = 0x45
    case AmbientAirTemperature = 0x46
    case AbsoluteThrottlePositionB = 0x47
    case AbsoluteThrottlePositionC = 0x48
    case AcceleratorPedalPositionD = 0x49
    case AcceleratorPedalPositionE = 0x4a
    case AcceleratorPedalPositionF = 0x4b
    case CommandedThrottleActuator = 0x4c
    case TimeRunWithMILOn = 0x4d
    case TimeSinceTroubleCodesCleared = 0x4e

  // From this point sensors don't have full support yet
    case MaxValueForER_OSV_OSC_IMAP = 0x4f /* Maximum value for equivalence ratio, oxygen sensor voltage,
   oxygen sensor current and intake manifold absolute pressure
   */
    case MaxValueForAirFlowRateFromMAFSensor = 0x50
    case FuelType = 0x51
    case EthanolFuelRatio = 0x52
    case AbsoluteEvapSystemVaporPressure = 0x53
    case EvapSystemVaporPressure = 0x54
    case ShortTermSecondaryOxygenSensorTrimBank_1_3 = 0x55
    case LongTermSecondaryOxygenSensorTrimBank_1_3 = 0x56
    case ShortTermSecondaryOxygenSensorTrimBank_2_4 = 0x57
    case LongTermSecondaryOxygenSensorTrimBank_2_4 = 0x58
    case FuelRailPressure_Absolute = 0x59
    case RelativeAcceleratorPedalPosition = 0x5a
    case HybridBatteryPackRemainingLife = 0x5b
    case EngineOilTemperature = 0x5c

    // OBD2SensorsVIN = 0x123,
    //    OBD2Sensor = 0x,
    // Sensors should be added at this point for supporting count and last.
}
