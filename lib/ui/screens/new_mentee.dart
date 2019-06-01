import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mentor4food/db/mentee_provider.dart';
// import 'package:mentor4food/db/mentor_provider.dart';
import 'package:mentor4food/model/mentee.dart';
// import 'package:mentor4food/model/mentor.dart';
import 'package:intl/intl.dart';

class NewMentee extends StatefulWidget {
  static final String routeName = '/new';
  final Mentee mentee;
  final DateFormat formatter = new DateFormat.yMMMMd("en_US");

  NewMentee({Key key, this.mentee}) : super(key: key) {
    // if (mentee.date == null) {
    //   this.mentee.date = formatter.format(new DateTime.now());
    // }
  }

  @override
  _NewMenteeState createState() => new _NewMenteeState(mentee: this.mentee);
}

class _NewMenteeState extends State<NewMentee> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  // List<Category> _categoryList = [];
  // Category _category;
  Mentee mentee;

  _NewMenteeState({this.mentee});

  AppBar _createAppBar() {
    return new AppBar(
      title: new Text(_getTitle()),
      actions: <Widget>[_createSaveUpdateAction()],
    );
  }

  IconButton _createSaveUpdateAction() {
    return new IconButton(
      onPressed: () {
        print('test');
        _saveMentee();
      },
      icon: const Icon(Icons.save),
    );
  }

  _saveMentee() async {

    print('saveMentee: ${mentee}');
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      MenteeProvider provider = new MenteeProvider();
      // widget.mentee.categoryId = _category.id;
//      print(widget.mentee);
      if (!_isExistRecord()) {
        await provider.insert(mentee);
      } else {
        await provider.update(mentee);
      }
      Navigator.of(context).pushNamed("/mentee");
    }
  }

  bool _isExistRecord() {
    return mentee.id == null ? false : true;
  }

  @override
  void initState() {
    super.initState();
    this.mentee = Mentee('id', 'name', 'technology', 'date', 'problem');
    // new CategoryProvider().getAllCategory().then((categories) {
    //   setState(() {
    //     if (_isExistRecord())
    //       _category = categories
    //           .firstWhere((category) => category.id == widget.mentee.categoryId);
    //     _categoryList = categories;
    //   });
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _getTitle() {
    return 'Create a mentee';
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _createAppBar(),
      body: new Padding(
          padding: new EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 5.0),
          child: new Form(
            onWillPop: _warnUserWithoutSaving,
            key: _formKey,
            child: new Column(
              children: <Widget>[
                _createDatePicker(),
                _createProblem(),
                _createName(), //
                _createTechnology(),
                // _categoryList.isNotEmpty
                //     ? _createCategoryDropDownList(_categoryList)
                //     : new Container()
              ],
            ),
          )),
    );
  }

  Row _createDatePicker() {
    return new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Icons.date_range,
          color: Theme.of(context).primaryColor,
        ),
        new InkWell(
          child: new Padding(
            padding: new EdgeInsets.only(
                left: 18.0, top: 8.0, bottom: 8.0, right: 18.0),
            child: new Text(
              mentee != null ? mentee.date : DateTime.now().toString(),
              style: new TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 14.0),
            ),
          ),
          onTap: _pickDateFromDatePicker,
        )
      ],
    );
  }

  // Row _createCategoryDropDownList(List<Category> categories) {
  //   return new Row(
  //       mainAxisSize: MainAxisSize.max,
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: <Widget>[
  //         new Icon(
  //           Icons.list,
  //           color: Theme.of(context).primaryColor,
  //         ),
  //         new Padding(
  //             padding:
  //                 new EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
  //             child: new DropdownButtonHideUnderline(
  //               child: new DropdownButton(
  //                   value: _category ??
  //                       (categories.length > 0
  //                           ? _category = categories[0]
  //                           : null),
  //                   items: _createCategoryDropDownMenuItems(categories),
  //                   isDense: true,
  //                   onChanged: (value) {
  //                     setState(() => _category = value);
  //                   }),
  //             ))
  //       ]);
  // }

  // List<DropdownMenuItem<Category>> _createCategoryDropDownMenuItems(
  //     List<Category> categories) {
  //   return categories.map((category) {
  //     return new DropdownMenuItem(
  //         value: category,
  //         child: new Text(category.name,
  //             style: new TextStyle(
  //                 color: Theme.of(context).primaryColor, fontSize: 16.0)));
  //   }).toList();
  // }

  _pickDateFromDatePicker() async {
//    DateTime dateTime = widget.formatter.parse(widget.mentee.date);
    DateTime dateTimePicked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2030)
    );
    if (dateTimePicked != null) {
      setState(() {
        mentee.date = widget.formatter.format(dateTimePicked);
      });
    }
  }

  Future<bool> _warnUserWithoutSaving() async {
    if (_isExistRecord()) {
      return true;
    } else {
      return await showDialog<bool>(
            context: context,
            child: new AlertDialog(
              title: const Text('Discard To do'),
              content: const Text('Do you want close without saving entry?'),
              actions: <Widget>[
                new FlatButton(
                  child: const Text('YES'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                new FlatButton(
                  child: const Text('NO'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            ),
          ) ??
          false;
    }
  }

  TextFormField _createProblem() {
    return new TextFormField(
      textAlign: TextAlign.justify,
      maxLines: 3,
      decoration: const InputDecoration(
        contentPadding: const EdgeInsets.all(2.0),
        icon: const Icon(Icons.note),
        hintText: 'My problem is xxxxxx',
        labelText: 'State your problem here ',
      ),
      initialValue:  mentee != null ? mentee.problem : 'Default',
      keyboardType: TextInputType.text,
      validator: _validateNote,
      onSaved: _problemOnSave,
    );
  }

  TextFormField _createName() {
    return new TextFormField(
      textAlign: TextAlign.justify,
      maxLines: 3,
      decoration: const InputDecoration(
        contentPadding: const EdgeInsets.all(2.0),
        icon: const Icon(Icons.note),
        hintText: 'John',
        labelText: 'State your name here ',
      ),
      initialValue: mentee != null ? mentee.name : 'Default Name',
      keyboardType: TextInputType.text,
      validator: _validateNote,
      onSaved: _nameOnSave,
    );
  }

  TextFormField _createTechnology() {
    return new TextFormField(
      textAlign: TextAlign.justify,
      maxLines: 3,
      decoration: const InputDecoration(
        contentPadding: const EdgeInsets.all(2.0),
        icon: const Icon(Icons.note),
        hintText: 'e.g. SQL',
        labelText: 'State your technology here ',
      ),
      initialValue: mentee != null ? mentee.technology : 'Default Tech',
      keyboardType: TextInputType.text,
      validator: _validateNote,
      onSaved: _technologyOnSave,
    );
  }

  String _validateNote(String value) {
    return value.isEmpty ? 'Field is required' : null;
  }

  void _problemOnSave(String value) {
    mentee.problem = value;
  }

  void _technologyOnSave(String value) {
    mentee.technology = value;
  }

  void _nameOnSave(String value) {
    mentee.name = value;
  }
}
