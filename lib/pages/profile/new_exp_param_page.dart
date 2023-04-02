import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/providers/experiment_mv.dart';
import 'package:senior_project/widgets/buttons/button.dart';

enum IsJoinable { joinable, notJoinable }

class NewExperimentPage extends StatefulWidget {
  const NewExperimentPage({Key? key}) : super(key: key);

  @override
  State<NewExperimentPage> createState() => _NewExperimentPageState();
}

class _NewExperimentPageState extends State<NewExperimentPage> {
  IsJoinable _currentChoice = IsJoinable.joinable;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ExperimentParametersMV>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(248, 180, 1, 1),
        title: const Text(
          'Experiment parameters',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _ErrorMessageWidget(),
                _buildTextInput(
                    controller: model.titleExperimentController,
                    title: 'Title of the experiment:'),
                _buildTextInput(
                    controller: model.descriptionController,
                    title: 'Description:'),
                _buildTextInput(
                    controller: model.wordsController,
                    title: 'Enter a list of words:'),
                _buildTextInput(
                    controller: model.wordShowTimeController,
                    title: 'Word show time (in sec):'),
                _buildTextInput(
                    controller: model.betweenWordTimeController,
                    title: 'Interval between showing words (in sec):'),
                _buildRadioButtons(context, model),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                    onTap: () async {
                      print('new exp is creating');
                      print(model.errorMessage);
                      model.createExperiment(context);
                    },
                    child: ButtonWidget(txt: 'Create')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRadioButtons(
      BuildContext context, ExperimentParametersMV model) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Do you want participants to be able to find or join the given experiment?',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 130,
                height: 50,
                child: ListTile(
                  title: const Text('Yes',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                  leading: Radio<IsJoinable>(
                    value: IsJoinable.joinable,
                    groupValue: _currentChoice,
                    onChanged: (IsJoinable? value) {
                      setState(() {
                        _currentChoice = IsJoinable.joinable;
                      });
                      model.isJoinableExperiment = "True";
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 130,
                height: 50,
                child: ListTile(
                  title: const Text('No',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                  leading: Radio<IsJoinable>(
                    value: IsJoinable.notJoinable,
                    groupValue: _currentChoice,
                    onChanged: (IsJoinable? value) {
                      setState(() {
                        _currentChoice = IsJoinable.notJoinable;
                      });
                      model.isJoinableExperiment = "False";
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextInput(
      {required TextEditingController controller, required String title}) {
    return SizedBox(
      // color: Colors.red,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 38,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 223, 221, 221),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.text,
                style: GoogleFonts.livvic(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 22),
                decoration: const InputDecoration(
                  filled: false,
                  contentPadding: EdgeInsets.only(left: 15, bottom: 15),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                )),
          ),
        ],
      ),
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage =
        Provider.of<ExperimentParametersMV>(context).errorMessage;
    if (errorMessage == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Text(errorMessage,
          style: const TextStyle(fontSize: 17, color: Colors.red)),
    );
  }
}
