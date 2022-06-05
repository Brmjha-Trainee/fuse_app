import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import '../translations/locale_keys.g.dart';
import 'package:multi_select_item/multi_select_item.dart';

class Survey2 extends StatefulWidget {
  const Survey2({Key? key}) : super(key: key);

  @override
  State<Survey2> createState() => _Survey2State();
}

class _Survey2State extends State<Survey2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedChoice = "";
  bool isSelected = false;
  int _selectedIndex = -1;
  List<String> _choices = [
    'Wider product selection',
    'Better shipping options',
    'Easier return process',
    'More brands options'
  ];
  List mainList = [];
  MultiSelectController controller = new MultiSelectController();
  // static List<Animal> _animals = [
  //   Animal(id: 1, name: "Lion"),
  //   Animal(id: 2, name: "Flamingo"),
  //   Animal(id: 3, name: "Hippo"),
  //   Animal(id: 4, name: "Horse"),
  // ];
  // final _items = _animals
  //     .map((animal) => MultiSelectItem<Animal>(animal, animal.name!))
  //     .toList();
  // List<Animal> _selectedAnimals = [];
  // final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    mainList.add({"key": "1"});
    mainList.add({"key": "2"});
    mainList.add({"key": "3"});
    mainList.add({"key": "4"});

    controller.disableEditingWhenNoneSelected = true;
    controller.set(mainList.length);
  }

  void add() {
    mainList.add({"key": mainList.length + 1});

    setState(() {
      controller.set(mainList.length);
    });
  }

  void delete() {
    var list = controller.selectedIndexes;
    list.sort((b, a) =>
        a.compareTo(b)); //reoder from biggest number, so it wont error
    list.forEach((element) {
      mainList.removeAt(element);
    });

    setState(() {
      controller.set(mainList.length);
    });
  }

  void selectAll() {
    setState(() {
      controller.toggleAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar3(context),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(children: <Widget>[
          Text(
            'Help us help you.\nwhat we can do better?',
            style: subtitle2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Select one or more option',
            style: h2.copyWith(color: IN_BETWEEN_GREY),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          //choices(),
          WillPopScope(
            onWillPop: () async {
              //block app from quitting when selecting
              var before = !controller.isSelecting;
              setState(() {
                controller.deselectAll();
              });
              return before;
            },
            child: new Scaffold(
              appBar: new AppBar(
                title: new Text(
                    'Selected ${controller.selectedIndexes.length}  ' +
                        controller.selectedIndexes.toString()),
                actions: (controller.isSelecting)
                    ? <Widget>[
                        IconButton(
                          icon: Icon(Icons.select_all),
                          onPressed: selectAll,
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: delete,
                        )
                      ]
                    : <Widget>[],
              ),
              body: ListView.builder(
                itemCount: mainList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: MultiSelectItem(
                      isSelecting: controller.isSelecting,
                      onSelected: () {
                        setState(() {
                          controller.toggle(index);
                        });
                      },
                      child: Container(
                        child: ListTile(
                          title: new Text(" Title ${mainList[index]['key']}"),
                          subtitle:
                              new Text("Description ${mainList[index]['key']}"),
                        ),
                        decoration: controller.isSelected(index)
                            ? new BoxDecoration(color: Colors.grey[300])
                            : new BoxDecoration(),
                      ),
                    ),
                  );
                },
              ),
              floatingActionButton: new FloatingActionButton(
                onPressed: add,
                tooltip: 'Increment',
                child: new Icon(Icons.add),
              ),
            ),
          ),
          // MultiSelectChipField<Animal>(
          //   items: _items,
          //   key: _multiSelectKey,
          //   validator: (values) {
          //     return null;
          //   },
          //   itemBuilder: (item, state) {
          //     // return your custom widget here
          //     return InkWell(
          //       onTap: () {
          //         _selectedAnimals.contains(item.value)
          //             ? _selectedAnimals.remove(item.value)
          //             : _selectedAnimals.add(item.value);
          //         state.didChange(_selectedAnimals);
          //         _multiSelectKey.currentState?.validate();
          //       },
          //       child: Text(item.value.name!),
          //     );
          //   },
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Back'),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                      }
                    },
                    child: Text(LocaleKeys.send.tr()),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget choices() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _choices.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: COLOR_PRIMARY, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? COLOR_PRIMARY
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  duration: Duration(milliseconds: 100),
                  child: ListTile(
                    title: Text(
                      _choices[index],
                      style: h1.copyWith(
                        fontSize: 21,
                        color: _selectedIndex == index ? WHITE : COLOR_PRIMARY,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () => setState(() {
                      _selectedIndex = index;
                    }),
                  ),
                ),
              ),
            ],
          );
        });
  }

  // Widget choiceChips() {
  //   return Expanded(
  //     child: ListView.builder(
  //       itemCount: _choices.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return ChoiceChip(
  //           label: Text(_choices[index]),
  //           selected: selectedChoice == _choices[index],
  //           selectedColor: COLOR_PRIMARY,
  //           onSelected: (selected) {
  //             setState(() {
  //               isSelected = selected;
  //             });
  //           },
  //           side: BorderSide(color: COLOR_PRIMARY),
  //           backgroundColor: WHITE,
  //           labelStyle: TextStyle(color: BLACK),
  //         );
  //       },
  //     ),
  //   );
  // }
}
