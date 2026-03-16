abstract class Failures {
  final String message;
  const Failures(this.message);
}

class DatabaseFailure extends Failures {
  const DatabaseFailure(super.message);
}

class NotificationFailure extends Failures {
  const NotificationFailure(super.message);
}
