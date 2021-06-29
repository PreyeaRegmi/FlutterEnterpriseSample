import 'package:demo_enterprise_app/common/base_presenter.dart';
import 'package:demo_enterprise_app/data/mocked/mocked_billing_info_respository.dart';
import 'package:demo_enterprise_app/usecase/post_billing_info_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class BillingScreenPresenter extends BasePresenter {
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController address;

  final PublishSubject<BillingInfoRequest> billingActionResultNotifier;

  final CompositeSubscription useCaseSubs;

  BillingScreenPresenter()
      : useCaseSubs = CompositeSubscription(),
        billingActionResultNotifier = PublishSubject(),
        firstName = TextEditingController(),
        lastName = TextEditingController(),
        email = TextEditingController(),
        address = TextEditingController(),
        super();

  @override
  void releaseResources() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    address.dispose();
    useCaseSubs.dispose();
  }

  void onBillingInfoSubmitBtnPresses() {
    if (validateBillingInfoRequest()) {
      proceedToSubmitBilllingInfo(BillingInfoRequest(firstName.value.text,
          lastName.value.text, email.value.text, address.value.text));
    } else
      showToast("Please provide correct data.");
  }

  bool validateBillingInfoRequest() {
    return true;
  }

  void proceedToSubmitBilllingInfo(BillingInfoRequest billingInfoRequest) {
    useCaseSubs.add(PostBillingInfoUseCase(MockedBillingInfoRepository())
        .execute(billingInfoRequest, (result) {
      showToast("Billing Information Submitted Successfully");
      //Nav to shipping screen;
      billingActionResultNotifier.add(billingInfoRequest);
    }, (errorMessage) {
      showToast(errorMessage);
    }));
  }
}
