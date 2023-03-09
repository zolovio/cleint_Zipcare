import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/components/custom_widgets.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/job_detail/contract/generate_contract_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GenerateContract extends ConsumerWidget {
  GenerateContract({Key? key}) : super(key: key);

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contractController = ref.watch(generateContractProvider);

    return Scaffold(
      appBar: getAppBar(context, contractText, true, true),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            FormBuilder(
              key: _formKey,
              onChanged: () {
                _formKey.currentState!.save();
              },
              autovalidateMode: AutovalidateMode.disabled,
              skipDisabled: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 15),
                  getQuestionsWidget(
                      "Do you already employ this carer with an employment contract?",
                      false,
                      "",
                      false),
                  FormBuilderRadioGroup<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    initialValue:
                        contractController.yesNo[contractController.isEmployContract ? 0 : 1],
                    name: 'employ_contract',
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    wrapSpacing: MediaQuery.of(context).size.width * 0.3,
                    onChanged: (value) => contractController.onEmployContract(),
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                    options: contractController.yesNo
                        .map(
                          (val) => FormBuilderFieldOption(
                            value: val,
                            child: Text(
                              val,
                              style: GoogleFonts.lexend(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                        .toList(growable: false),
                    controlAffinity: ControlAffinity.leading,
                  ),
                  const SizedBox(height: 15),
                  getQuestionsWidget("When did the employment begin?", false, "", false),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    name: 'start_date',
                    controller: contractController.startDate,
                    decoration: InputDecoration(
                      labelText: "Start Date",
                      labelStyle: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(calender, width: 20, height: 10),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
                        borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                      ),
                    ),
                    validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000));

                      if (pickedDate != null) {
                        String formattedDate = DateFormat('dd-MMM-yyyy').format(pickedDate);

                        contractController.startDate.text = formattedDate;
                      }
                    },
                    onChanged: (value) {
                      _formKey.currentState?.fields['start_date']?.validate();
                    },
                  ),
                  const SizedBox(height: 15),
                  getQuestionsWidget("When did the employment begin?", false, "", false),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    name: 'end_date',
                    controller: contractController.endDate,
                    decoration: InputDecoration(
                      labelText: "End Date",
                      labelStyle: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(calender, width: 20, height: 10),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
                        borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                      ),
                    ),
                    validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000));

                      if (pickedDate != null) {
                        String formattedDate = DateFormat('dd-MMM-yyyy').format(pickedDate);

                        contractController.endDate.text = formattedDate;
                      }
                    },
                    onChanged: (value) {
                      _formKey.currentState?.fields['start_date']?.validate();
                    },
                  ),
                  const SizedBox(height: 15),
                  getQuestionsWidget("What is the carer's gross monthly pay?*", false, "", false),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    name: 'pay',
                    decoration: InputDecoration(
                      labelText: 'Add',
                      labelStyle: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
                        borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                      ),
                    ),
                    onChanged: (val) {},
                    validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  onPressed: () => contractController.onGenerateContract(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkPurpleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                            child: Text(
                              nextText,
                              style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Image.asset(next),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
