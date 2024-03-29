import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/job_detail/job_detail_screen/service_agreement/service_ageement_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceAgreement extends ConsumerWidget {
  const ServiceAgreement({Key? key, required this.isContract}) : super(key: key);

  final bool isContract;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceController = ref.watch(serviceAgreementProvider);

    return Scaffold(
      appBar: getAppBar(context, serviceAgreementText, true, true),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            if (!isContract) ...[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: AppColors.darkPurpleColor.withOpacity(.2),
                        backgroundColor: AppColors.darkPurpleColor,
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
                                    color: serviceController.isApproved
                                        ? AppColors.greenColor
                                        : AppColors.darkPurpleColor,
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
            ],
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
                            color: AppColors.mediumGreyColor,
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
                            color: AppColors.mediumGreyColor,
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
                    borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
                    borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                  ),
                ),
                onChanged: (val) {},
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
            ],
            const Divider(height: 3, color: AppColors.lighterGreyColor),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  if (serviceController.isApproved) ...[
                    ElevatedButton(
                      onPressed: () => serviceController.isEdit
                          ? serviceController.onView(serviceController.contractController.text)
                          : serviceController.onEdit(),
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: AppColors.darkPurpleColor.withOpacity(.5),
                        backgroundColor: AppColors.darkPurpleColor,
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
                                    color: AppColors.whiteColor,
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
                      onPressed: () => serviceController.isEdit
                          ? serviceController.onView(serviceController.contractController.text)
                          : serviceController.onEdit(),
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: AppColors.darkPurpleColor.withOpacity(.5),
                        backgroundColor: AppColors.darkPurpleColor,
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
                                  serviceController.isEdit
                                      ? viewText
                                      : serviceController.isSend
                                          ? downloadText
                                          : editText,
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(
                                serviceController.isEdit
                                    ? viewJob
                                    : serviceController.isSend
                                        ? download
                                        : edit,
                                width: 20,
                                height: 20),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () => serviceController.isEdit
                          ? serviceController.onReset()
                          : serviceController.isSend
                              ? serviceController.onSendNav(isContract)
                              : isContract
                                  ? serviceController.onSend()
                                  : serviceController.onApprove(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkPurpleColor,
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
                                  serviceController.isEdit
                                      ? resetText
                                      : serviceController.isSend
                                          ? payDepositText
                                          : isContract
                                              ? sendText
                                              : approveText,
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            if (!serviceController.isSend)
                              Image.asset(serviceController.isEdit
                                  ? reset
                                  : isContract
                                      ? messageSend
                                      : approve),
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
