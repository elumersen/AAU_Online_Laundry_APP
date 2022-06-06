abstract class SignUpFormSubmissionStatus {
  const SignUpFormSubmissionStatus();
}

class InitialFormStatus extends SignUpFormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends SignUpFormSubmissionStatus {}

class SubmittingSuccess extends SignUpFormSubmissionStatus {}

class SubmittingFailure extends SignUpFormSubmissionStatus {
  SubmittingFailure(this.exception);
  final String exception;
}
