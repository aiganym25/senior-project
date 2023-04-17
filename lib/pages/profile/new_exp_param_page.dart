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
  int _selectedOption = 1;

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
                _buildRadioButtons(context, model),
                _buildTextInput(
                    controller: model.wordShowTimeController,
                    title: 'Word show time (in sec):'),
                _buildTextInput(
                    controller: model.betweenWordTimeController,
                    title: 'Interval between showing words (in sec):'),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                    onTap: () async {
                      final statusCode = await model.createExperiment(context);

                      if (statusCode == 200) {
                        setState(() {});
                        print('er');
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Experiment is created successfully')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Something gone wrong')));
                      }
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Choose words by',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        SizedBox(
          // width: MediaQuery.of(context).size.width * 0.8,
          child: ListTile(
            title: const Text(
              'Frequency and length',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            leading: Radio(
              value: 1,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = int.parse(value.toString());
                });
                model.selectedOption = int.parse(value.toString());
              },
            ),
          ),
        ),
        SizedBox(
          child: ListTile(
            title: const Text(
              'Randomize',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            leading: Radio(
              value: 2,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = int.parse(value.toString());
                });
                model.selectedOption = int.parse(value.toString());
              },
            ),
          ),
        ),
        SizedBox(
          child: ListTile(
            title: const Text(
              'Enter my own words',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            leading: Radio(
              value: 3,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = int.parse(value.toString());
                });
                model.selectedOption = int.parse(value.toString());
              },
            ),
          ),
        ),
        _selectedOption == 1
            ? _buildFrequencyInput(model)
            : _selectedOption == 2
                ? _buildTextInput(
                    controller: model.numberOfWordsController,
                    title: 'Number of words:')
                : _buildTextInput(
                    controller: model.wordsController,
                    title: 'Enter a list of words:'),
      ],
    );
  }

  Widget _buildTextInput(
      {required TextEditingController controller, required String title}) {
    return Column(
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
          margin: const EdgeInsets.only(bottom: 16),
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
    );
  }

  Widget _buildFrequencyInput(ExperimentParametersMV model) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 16,
            ),
            _buildTextInput(
                controller: model.numberOfWordsController,
                title: 'Number of words:'),
            const Text(
              'Choose frequency of words in the range [3000 - 14000]',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Lower limit',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 38,
              margin: const EdgeInsets.only(
                bottom: 16,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 223, 221, 221),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                  controller: model.lowerFreqController,
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
            const Text(
              'Upper limit',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 38,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 223, 221, 221),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                  controller: model.upperFreqController,
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
            _buildTextInput(
                controller: model.lengthController, title: 'Length of words in the range [3 - 6]:')
          ],
        )
      ],
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
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(errorMessage,
          style: const TextStyle(fontSize: 17, color: Colors.red)),
    );
  }
}
