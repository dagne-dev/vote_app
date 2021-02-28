import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_project/PartyElection/bloc/bloc.dart';
import 'package:main_project/PartyElection/models/models.dart';
import 'package:main_project/PartyElection/screens/party_list.dart';
import 'package:main_project/PartyElection/screens/party_route.dart';
import 'package:main_project/components/constants.dart';

class AddUpdateParty extends StatefulWidget {
  static const routeName = '/partyAddUpdate';
  final PartyArgument args;

  AddUpdateParty({this.args});
  @override
  _AddUpdatePartyState createState() => _AddUpdatePartyState();
}

class _AddUpdatePartyState extends State<AddUpdateParty> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _party = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('${widget.args.edit ? "Edit Party" : "Add New Party"}'),
      //   backgroundColor: KPrimaryColor,
      // ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('${widget.args.edit ? "Edit Party" : "Add New Party"}'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                    initialValue:
                        widget.args.edit ? widget.args.party.headQuarter : '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter party Leader';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Party President',
                        border: OutlineInputBorder(),
                        hintText: 'Dr/Mr. SomeOne'),
                    onSaved: (value) {
                      setState(() {
                        this._party["leader"] = value;
                      });
                    }),
                TextFormField(
                    initialValue:
                        widget.args.edit ? widget.args.party.partyName : '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Party Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Party Name ',
                        border: OutlineInputBorder(),
                        hintText: 'Democrats'),
                    onSaved: (value) {
                      this._party["name"] = value;
                    }),
                TextFormField(
                    initialValue: widget.args.edit
                        ? widget.args.party.hpr.toString()
                        : '', //////////////////ID or Head Quarter
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter HPR Member if Any';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'HPR Members',
                        border: OutlineInputBorder(),
                        hintText: 'Representatives'),
                    onSaved: (value) {
                      setState(() {
                        this._party["hpr"] = int.parse(value);
                      });
                    }),
                TextFormField(
                    initialValue:
                        widget.args.edit ? widget.args.party.description : '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Party Description:';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Party Description',
                        border: OutlineInputBorder(),
                        hintText: 'Ideology and party manuals'),
                    onSaved: (value) {
                      setState(() {
                        this._party["description"] = value;
                      });
                    }),
                TextFormField(
                    initialValue:
                        widget.args.edit ? widget.args.party.description : '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Party Head Quarter:';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Party Region',
                        border: OutlineInputBorder(),
                        hintText: 'Addis Ababa'),
                    onSaved: (value) {
                      setState(() {
                        this._party["region"] = value;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final form = _formKey.currentState;
                      if (form.validate()) {
                        form.save();
                        final PartyEvent event = widget.args.edit
                            ? PartyUpdate(
                                Party(
                                  id: widget.args.party.id,
                                  partyLeader: this._party["leader"],
                                  vote: this._party["vote"],
                                  partyName: this._party["name"],
                                  hpr: this._party["hpr"],
                                  headQuarter: this._party["region"],
                                  description: this._party["description"],
                                  // image: this._party["image"],
                                ),
                              )
                            : PartyCreate(
                                Party(
                                  partyLeader: this._party["leader"],
                                  // id: widget.args.party
                                  //     .id, /////////////////////////////////////////////////////id called with null error
                                  id: this._party["id"],
                                  vote: this._party["vote"] = 0,
                                  partyName: this._party["name"],
                                  hpr: this._party["hpr"],
                                  headQuarter: this._party["region"],
                                  description: this._party["description"],
                                  // image: this._party["image"],
                                ),
                              );
                        BlocProvider.of<PartyBloc>(context).add(event);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            PartyList.routeName, (route) => true);
                      }
                    },
                    label: Text('SAVE'),
                    icon: Icon(Icons.save),
                  ),
                ),
              ],
            ))),
      ),
    );
  }

  final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    title: Text('Parties Info Insert'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.list),
        onPressed: () {},
      )
    ],
  );
}
