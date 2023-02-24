import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
import 'package:client_zipcare/src/features/home/job_detail/job_detail_screen/service_agreement/service_ageement_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceAgreement extends ConsumerWidget {
  const ServiceAgreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceController = ref.watch(serviceAgreementProvider);

    return Scaffold(
      appBar: getAppBar(serviceAgreementText, true, context),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: primaryColor.withOpacity(.2),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                serviceController.isEdit
                                    ? editServiceText
                                    : serviceController.isApproved
                                        ? approvedText
                                        : approvalWaitText,
                                style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: serviceController.isApproved ? greenColor : primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (!serviceController.isEdit) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          serviceController.contractDetail,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: underlineColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ] else if (serviceController.isView) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          serviceController.contractData,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: underlineColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ] else if (serviceController.isApproved)
              ...[]
            else ...[
              FormBuilderTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: serviceController.contractController,
                name: 'contract_details',
                maxLines: 30,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  labelText: "Enter Contract Details",
                  labelStyle: GoogleFonts.lexend(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  alignLabelWithHint: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: hintLightColor),
                    borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                  ),
                ),
                onChanged: (val) {},
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
            ],
            const Divider(height: 3, color: hintLightColor),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  if (serviceController.isApproved) ...[
                    ElevatedButton(
                      onPressed: () =>
                          serviceController.isEdit ? serviceController.onView(serviceController.contractController.text) : serviceController.onEdit(),
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: primaryColor.withOpacity(.5),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  downloadText,
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(download, width: 20, height: 20),
                          ],
                        ),
                      ),
                    ),
                  ] else ...[
                    ElevatedButton(
                      onPressed: () =>
                          serviceController.isEdit ? serviceController.onView(serviceController.contractController.text) : serviceController.onEdit(),
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: primaryColor.withOpacity(.5),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  serviceController.isEdit ? viewText : editText,
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(serviceController.isEdit ? viewJob : edit),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () => serviceController.isEdit ? serviceController.onReset() : serviceController.onApprove(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  serviceController.isEdit ? resetText : approveText,
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(serviceController.isEdit ? reset : approve),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
