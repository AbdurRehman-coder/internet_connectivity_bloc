
abstract class InternetState {}

/// We extends all these three class from [InternetState] to have same data type.
class InternetInitialState extends InternetState{}
class InternetLostState extends InternetState{}
class InternetGainedState extends InternetState{}