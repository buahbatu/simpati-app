import 'package:flutter/material.dart';
import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/core/utils/date_utils.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/immunization.dart';
import 'package:simpati/presentation/child/fragment/immunization/bloc.dart';

class ChildImmunizationDialog extends StatefulWidget {
  final ImmunizationListBloc bloc;
  final Child child;
  final Immunization initialData;

  const ChildImmunizationDialog(
    this.bloc,
    this.child,
    this.initialData, {
    Key key,
  }) : super(key: key);

  @override
  _ChildImmunizationDialogState createState() => _ChildImmunizationDialogState(
        immunization: initialData?.copyWith(),
      );
}

class _ChildImmunizationDialogState extends State<ChildImmunizationDialog> {
  Immunization immunization;
  final TextEditingController dateController = TextEditingController();

  _ChildImmunizationDialogState({this.immunization});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Periksa ${immunization.config.title}',
              style: AppTextStyle.sectionTitle,
            ),
          ),
          Container(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              child: FormUtils.buildField(
                'Tanggal Periksa',
                controller: dateController
                  ..text = immunization?.createdAt?.standardFormat(),
                isEnabled: false,
                inputType: TextInputType.datetime,
              ),
              onTap: widget.initialData.createdAt == null
                  ? () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1940),
                        lastDate: DateTime(2080),
                      );
                      if (date != null) {
                        immunization = immunization.copyWith(createdAt: date);
                        setState(() {
                          dateController.text = date.standardFormat();
                        });
                      }
                    }
                  : null,
            ),
          ),
          if (widget.initialData.createdAt != null) Container(height: 12),
          if (widget.initialData.createdAt == null)
            Container(
              padding: const EdgeInsets.all(16),
              child: FlatButton(
                color: AppColor.primaryColor,
                textColor: Colors.white,
                child: Text('Simpan'),
                onPressed: () {
                  if (immunization.createdAt != null) {
                    widget.bloc.add(Add<Immunization>(immunization));
                    Navigator.of(context).pop();
                  }
                },
              ),
            )
        ],
      ),
    );
  }
}
