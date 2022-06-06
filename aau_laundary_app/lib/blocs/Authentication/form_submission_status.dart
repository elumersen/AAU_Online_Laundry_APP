abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class SubmittingSuccess extends FormSubmissionStatus {
  String role;
  SubmittingSuccess({required this.role});
}

class SubmittingFailure extends FormSubmissionStatus {
  final String exception;
  const SubmittingFailure(this.exception);
}
