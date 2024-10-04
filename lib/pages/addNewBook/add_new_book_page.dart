import 'package:e_book_2023/components/back_button.dart';
import 'package:e_book_2023/components/multiLineTextFormField.dart';
import 'package:e_book_2023/components/my_text_form_field.dart';
import 'package:e_book_2023/config/colors.dart';
import 'package:e_book_2023/controller/book_controller.dart';
import 'package:e_book_2023/controller/pdf_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewBookPage extends StatelessWidget {
  const AddNewBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    PdfController pdfController = Get.put(PdfController());
    BookController bookController = Get.put(BookController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyBackButton(),
                            Text(
                              "Add New Book",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                            ),
                            SizedBox(
                              width: 63,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        CupertinoButton(
                          onPressed: () {
                            bookController.pickImage();
                          },
                          child: Obx(
                            () => Container(
                              height: 190,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).colorScheme.background,
                              ),
                              child: Center(
                                child: (bookController.isImageUploading.value ==
                                        true)
                                    ? CircularProgressIndicator(
                                        color: primaryColor,
                                      )
                                    : bookController.imageUrl.value == ""
                                        ? Image.asset(
                                            "assets/icons/addImage.png")
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              bookController.imageUrl.value,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: bookController.pdfUrl.value == ""
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: bookController.isPdfUploading.value
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: backgroudColor,
                                    ),
                                  )
                                : bookController.pdfUrl.value == ""
                                    ? InkWell(
                                        onTap: () {
                                          bookController.pickPDF();
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/icons/upload.png"),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Book PDF",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          bookController.pdfUrl.value = "";
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/icons/delete.png"),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Delete Pdf",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // Expanded(
                      //   child: Container(
                      //     padding: EdgeInsets.all(10),
                      //     decoration: BoxDecoration(
                      //       color: Theme.of(context).colorScheme.primary,
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Image.asset("assets/icons/upload.png"),
                      //         SizedBox(
                      //           width: 8,
                      //         ),
                      //         Text(
                      //           "Book Audio",
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .bodyLarge
                      //               ?.copyWith(
                      //                 color: Theme.of(context)
                      //                     .colorScheme
                      //                     .background,
                      //               ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextFormField(
                    hintText: "Book title",
                    icon: Icons.book,
                    controller: bookController.title,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MultiLineTextField(
                    hintText: "Book Description",
                    controller: bookController.des,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextFormField(
                    hintText: "Author Name",
                    icon: Icons.person,
                    controller: bookController.auth,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextFormField(
                    hintText: "About Author",
                    icon: Icons.person,
                    controller: bookController.aboutAuth,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextFormField(
                          isNumber: true,
                          hintText: "Price",
                          icon: Icons.currency_rupee,
                          controller: bookController.price,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: MyTextFormField(
                          isNumber: true,
                          hintText: "Pages",
                          icon: Icons.book,
                          controller: bookController.pages,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextFormField(
                          hintText: "Language",
                          icon: Icons.language,
                          controller: bookController.language,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: MyTextFormField(
                          hintText: "Audio Len",
                          icon: Icons.audiotrack,
                          controller: bookController.audioLen,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.close,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "CANCEL",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: bookController.isPostUploading.value
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : CupertinoButton(
                                    onPressed: () {
                                      bookController.createBook();
                                    },
                                    padding: EdgeInsets.zero,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.upload_sharp,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "POST",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
