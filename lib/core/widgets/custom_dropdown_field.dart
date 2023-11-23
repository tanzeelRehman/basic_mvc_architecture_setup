import 'dart:ui';

import 'package:basic_mvc_architecture_setup/core/globle/globle.dart';
import 'package:basic_mvc_architecture_setup/core/theme/app_theme.dart';
import 'package:basic_mvc_architecture_setup/core/widgets/Custom%20Routes/widget_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Custom Routes/Popups/show_pop_up.dart';

class CustomDropDownField extends StatefulWidget {
  CustomDropDownField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.icon,
      this.focusNode,
      this.validator,
      this.isPasswordField = false,
      this.keyboardType = TextInputType.text,
      this.checkEmptyString = true,
      this.shouldShowSearchBar = false,
      this.isReadOnly = false,
      this.maxLines = 1,
      this.maxlength,
      this.dropdownValues,
      this.onValueSelect,
      this.onTap,
      this.title,
      this.titleWidth,
      this.onChange,
      this.inputFormaters,
      this.color,
      this.suffix,
      this.dropdownSize,
      this.borderRadius,
      this.typingTextColor,
      this.putTitleInRow = false,
      this.passwordIcon,
      this.fillColor})
      : super(key: key);
  final String? title;

  /// used when putTile in row is true
  final double? titleWidth;
  final TextEditingController controller;
  final bool isPasswordField;
  final bool shouldShowSearchBar;
  final String hintText;
  final bool checkEmptyString;
  final bool isReadOnly;
  final FocusNode? focusNode;
  final Icon? passwordIcon;

  /// provide empty body to make it read only
  final Function()? onTap;
  final Function(String)? onValueSelect;
  final Function(String)? onChange;
  final int maxLines;
  int? maxlength;
  final TextInputType keyboardType;
  final Widget? icon;
  final Color? color;
  final Color? typingTextColor;
  final Widget? suffix;
  final List<String>? dropdownValues;
  final BorderRadius? borderRadius;
  final List<TextInputFormatter>? inputFormaters;
  final bool putTitleInRow;
  String? Function(String?)? validator;
  Size? dropdownSize;

  final Color? fillColor;

  @override
  State<CustomDropDownField> createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  bool isPasswordShow = false;

  ///
  final FocusNode _focusNode = FocusNode();

  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.title != null && !widget.putTitleInRow)
                Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 7.h),
                  child: Text(
                    widget.title!,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              const SizedBox(width: 20),
              Row(
                children: [
                  if (widget.title != null && widget.putTitleInRow)
                    SizedBox(
                      width: widget.titleWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 0, bottom: 12, right: 20),
                        child: Text(
                          widget.title!,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                  Expanded(
                    child: TextFormField(
                      maxLength: widget.maxlength,
                      key: _key,
                      controller: widget.controller,
                      focusNode: widget.focusNode ?? _focusNode,
                      validator: widget.validator ??
                          (val) {
                            if (val != null) {
                              if (val.isEmpty && widget.checkEmptyString) {
                                return "Field cannot be submitted empty";
                              }
                            }
                            return null;
                          },
                      readOnly: widget.dropdownValues != null ||
                          widget.onTap != null ||
                          widget.isReadOnly,
                      onChanged: widget.onChange,
                      inputFormatters: widget.inputFormaters,
                      onTap: widget.dropdownValues != null
                          ? () async {
                              if (widget.onTap != null) {
                                _focusNode.unfocus();
                                return widget.onTap!();
                              }
                              _focusNode.unfocus();

                              var res = await showPopUp(
                                context: navigatorKeyGlobal.currentContext!,
                                heroTag: widget.hintText,
                                rect: _key.location,
                                size: const Size(0, 60),
                                child: (onValueSelect) => PopupListView(
                                  dropdownValues: widget.dropdownValues,
                                  shouldIncludeSearchBar:
                                      widget.shouldShowSearchBar,
                                  size: widget.dropdownSize,
                                  onValueSelect: onValueSelect,
                                ),
                              );
                              if (res is String) {
                                widget.controller.text = res;
                                if (widget.onValueSelect != null) {
                                  widget.onValueSelect!(res);
                                }
                                setState(() {});
                              }
                            }
                          : widget.onTap,
                      obscureText: widget.isPasswordField && !isPasswordShow,
                      maxLines: widget.maxLines,
                      keyboardType: widget.keyboardType,

                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.displayMedium,
                      // TextStyle(
                      //     fontWeight: FontWeight.normal,
                      //     color: widget.typingTextColor ?? Colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.h),
                          // border: const OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black, width: 1)),
                          filled: true,
                          fillColor:
                              widget.fillColor ?? Theme.of(context).cardColor,
                          focusColor: Theme.of(context).primaryColorDark,
                          iconColor: Colors.black,
                          //      prefixIcon: Icon(Icons.add, color: Colors.red,)

                          suffixIcon: widget.isPasswordField
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isPasswordShow = !isPasswordShow;
                                    });
                                  },
                                  child: isPasswordShow
                                      ? Icon(
                                          Icons.visibility,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        )
                                      : Icon(
                                          Icons.visibility_off,
                                          color: Theme.of(context)
                                              .hintColor
                                              .withOpacity(.3),
                                        ),
                                )
                              : widget.suffix,
                          // widget.dropdownValues != null
                          //         ? Transform.translate(
                          //             offset: const Offset(0, 2),
                          //             child: const IgnorePointer(
                          //                 child: Icon(Icons.add)))
                          //         : widget.suffix,
                          // focusedErrorBorder: OutlineInputBorder(
                          //     borderRadius:
                          //         widget.borderRadius ?? BorderRadius.circular(8),
                          //     borderSide:
                          //         const BorderSide(color: Colors.red, width: 2)),
                          // border: OutlineInputBorder(
                          //     borderRadius:
                          //         widget.borderRadius ?? BorderRadius.circular(8),
                          //     borderSide: BorderSide(
                          //         color: widget.color ?? Colors.transparent,
                          //         width: 2)),
                          // enabledBorder: OutlineInputBorder(
                          //     borderRadius:
                          //         widget.borderRadius ?? BorderRadius.circular(8),
                          //     borderSide: BorderSide(
                          //         color: widget.color ?? Colors.transparent,
                          //         width: 2)),
                          // errorBorder: OutlineInputBorder(
                          //     borderRadius:
                          //         widget.borderRadius ?? BorderRadius.circular(8),
                          //     borderSide:
                          //         const BorderSide(color: Colors.red, width: 2)),
                          hintText: widget.hintText,
                          hintStyle: AppTheme.subtitle1,
                          //  TextStyle(
                          //   fontWeight: FontWeight.normal,
                          //   color:
                          //    widget.color ??
                          //       Theme.of(context)
                          //           .colorScheme
                          //           .secondary
                          //           .withOpacity(0.4),
                          // ),
                          // suffixIcon:,
                          focusedBorder: widget.dropdownValues != null
                              ? null
                              : OutlineInputBorder(
                                  borderRadius: widget.borderRadius ??
                                      BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: widget.color ??
                                          Theme.of(context).primaryColorDark,
                                      width: 3))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // if (widget.icon != null || widget.dropdownValues != null)
        //   Positioned(
        //     right: 8,
        //     top: 53,
        //
        //     child: IgnorePointer(
        //       child: SizedBox(
        //         width: 50,
        //         child: Padding(
        //           padding: EdgeInsets.only(
        //               left: 10, bottom: widget.maxLines != 1 ? 60 : 0),
        //           child: Align(
        //               alignment: Alignment.centerLeft,
        //               child: widget.icon ??
        //                   (widget.dropdownValues != null
        //                       ? const Icon(Icons.arrow_drop_down)
        //                       : widget.icon)),
        //         ),
        //       ),
        //     ),
        //   )
      ],
    );
  }
}

class PopupListView extends StatefulWidget {
  const PopupListView(
      {Key? key,
      this.dropdownValues,
      required this.shouldIncludeSearchBar,
      this.size,
      required this.onValueSelect})
      : super(key: key);
  final bool shouldIncludeSearchBar;
  final List<String>? dropdownValues;
  final Size? size;
  final Function onValueSelect;
  @override
  State<PopupListView> createState() => _PopupListViewState();
}

class _PopupListViewState extends State<PopupListView> {
  List<String>? searchedValues = [];
  TextEditingController cont = TextEditingController();
  final FocusNode node = FocusNode();
  @override
  void initState() {
    super.initState();
    searchedValues = widget.dropdownValues;
    node.addListener(() {
      setState(() {});
    });
  }

  void search(String search) {
    if (search.isEmpty) {
      searchedValues = widget.dropdownValues;
    } else {
      searchedValues = widget.dropdownValues!
          .where(
              (element) => element.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        height: (widget.size != null
                ? (((widget.dropdownValues!.length) * 65 +
                            (widget.shouldIncludeSearchBar ? 65 : 0)) >
                        widget.size!.height)
                    ? widget.size?.height
                    : widget.dropdownValues!.length * 65 +
                        20 +
                        (widget.shouldIncludeSearchBar ? 75 : 0)
                : 350)! +
            (widget.dropdownValues?.isEmpty ?? true ? 100 : 0),
        padding: const EdgeInsets.symmetric(vertical: 10),
        // margin: EdgeInsets.only(bottom: node.hasFocus ? 250 : 0),
        decoration: BoxDecoration(
          // color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.transparent),
        ),
        width: widget.size?.width ?? MediaQuery.of(context).size.width * 0.925,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.shouldIncludeSearchBar)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: cont,
                  focusNode: node,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: "Search here",
                      fillColor: Colors.black12,
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintStyle: AppTheme.subtitle1),
                  onChanged: (value) {
                    search(value);
                  },
                ),
              ),
            if (widget.dropdownValues!.isEmpty)
              const SizedBox(
                height: 100,
                child: Center(
                  child: Text("No Data Found"),
                ),
              ),
            Expanded(
              child: ScrollConfiguration(
                behavior: const ScrollBehavior(),
                child: ListView.builder(
                  itemCount: searchedValues!.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.only(bottom: 5, left: 10, right: 10),
                    child: Material(
                      elevation: 4,
                      color: Colors.white,
                      child: ListTile(
                          title: Text(
                            searchedValues![index],
                            style: AppTheme.subtitle1,
                          ),
                          onTap: () =>
                              // Navigator.pop(context, searchedValues![index]),
                              widget.onValueSelect(searchedValues![index])),
                    ),
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
