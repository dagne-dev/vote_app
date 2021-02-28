import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_project/ElectionInfo/election_info.dart';
import 'package:main_project/components/constants.dart';

class AddUpdateElection extends StatefulWidget {
  static const routeName = '/electionAddUpdate';
  final ElectionArgument args;

  AddUpdateElection({this.args});
  @override
  _AddUpdateElectionState createState() => _AddUpdateElectionState();
}

class _AddUpdateElectionState extends State<AddUpdateElection> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _election = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //       '${widget.args.edit ? "Edit Add Election Description" : "Add Election Description"}'),
      //   backgroundColor: KPrimaryColor,
      // ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text(
            '${widget.args.edit ? "Edit Information" : "Add Information"}'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.election.boardLeader : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter board Leader';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Board Leader',
                      border: OutlineInputBorder(),
                      hintText: 'Dr/Mr SomeOne'),
                  onSaved: (value) {
                    setState(() {
                      this._election["leader"] = value;
                    });
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.election.electionYear : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter ElectionYear';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Election Year ',
                      border: OutlineInputBorder(),
                      hintText: '2021'),
                  onSaved: (value) {
                    this._election["year"] = value;
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.election.country : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Country Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Country Name ',
                      border: OutlineInputBorder(),
                      hintText: 'Ethiopia'),
                  onSaved: (value) {
                    this._election["country"] = value;
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.election.description : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Election Description:';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Information',
                      border: OutlineInputBorder(),
                      hintText: 'New Information'),
                  onSaved: (value) {
                    setState(() {
                      this._election["description"] = value;
                    });
                  }),
              // TextFormField(
              //     initialValue:
              //         widget.args.edit ? widget.args.party.description : '',
              //     validator: (value) {
              //       if (value.isEmpty) {
              //         return 'Please Enter Party Head Quarter:';
              //       }
              //       return null;
              //     },
              //     decoration: InputDecoration(labelText: 'Party Region'),
              //     onSaved: (value) {
              //       setState(() {
              //         this._party["region"] = value;
              //       });
              //     }),
              // TextFormField(
              //     initialValue:
              //         widget.args.edit ? widget.args.party.description : '',
              //     validator: (value) {
              //       if (value.isEmpty) {
              //         return 'Please Enter Party Head Quarter:';
              //       }
              //       return null;
              //     },
              //     decoration: InputDecoration(labelText: 'Party HeadQuarter'),
              //     onSaved: (value) {
              //       setState(() {
              //         this._party["headQuarter"] = value;
              //       });
              //     }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      final ElectionEvent event = widget.args.edit
                          ? ElectionUpdate(
                              Election(
                                id: widget.args.election.id,
                                boardLeader: this._election["leader"],
                                country: this._election["country"],
                                electionYear: this._election["year"],
                                description: this._election["description"],
                              ),
                            )
                          : ElectionCreate(
                              Election(
                                // id: widget.args.election.id,
                                id: this._election["id"],
                                boardLeader: this._election["leader"],
                                country: this._election["country"],
                                electionYear: this._election["year"],
                                description: this._election["description"],
                                // image: this._party["image"],
                              ),
                            );
                      BlocProvider.of<ElectionBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          ElectionList.routeName, (route) => true);
                    }
                  },
                  label: Text('SAVE'),
                  icon: Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
