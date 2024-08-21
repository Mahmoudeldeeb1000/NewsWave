class RegesterStates {}

class RegesterInitialStates extends RegesterStates {}

class RegesterLoadingStates extends RegesterStates {}

class RegesterFailureStates extends RegesterStates {
  final String errorMessage;
  RegesterFailureStates({required this.errorMessage});
}

class RegesterSuccessStates extends RegesterStates {}
