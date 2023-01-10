
abstract class InternetEvent{}

/// These two class are actually two events and the both extends the [InternetEvent]
/// class which make a relation b/w these two class, Now these two classes
/// have same data types. [ which is InternetEvent ]
class InternetLostEvent extends InternetEvent{}
class InternetGainedEvent extends InternetEvent{}