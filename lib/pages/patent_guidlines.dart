import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:ipr/components/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ipr/pages/help.dart';
import 'package:ipr/pages/home_page.dart';
import 'package:ipr/pages/lang.dart';
import 'package:ipr/theme/colors.dart';
import 'package:ipr/util/account_images_json.dart';
import 'package:ipr/util/vaibhav_details.dart';
import 'dart:ui';
import 'package:ipr/pages/themeHelper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PatentGuide extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PatentGuideState();
  }
}

class _PatentGuideState extends State<PatentGuide> {
  final _formKey = GlobalKey<FormState>();
  bool checked1Value = false;
  bool checkbox1Value = false;
  bool checked2Value = false;
  bool checkbox2Value = false;
  bool checked3Value = false;
  bool checkbox3Value = false;
  bool checked4Value = false;
  bool checkbox4Value = false;
  int count = 0;
  int count1 = 0;
  int statesel = 0;
  int dissel = 0;

  var selectedstate;
  var selectedType2;
  List<String> _states = <String>[
    "Andaman and Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/guidepic.jpg'),
                                                fit: BoxFit.cover)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 30,
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Guidelines",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Title",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          child: Text(
                            "The title should be sufficiently indicative of the subject matter of the invention and shall disclose the specific features of the invention. It need not be the same as the preamble of the main claim. It shall be brief, free from fancy expressions or ambiguity and as precise and definite as possible, but it need not go into the details of the invention itself and should not ordinarily exceed fifteen words. The following are not permissible in the title: Inventors name, the word Patent, words in other languages, the abbreviation etc, fancy words e.g. “Washwell Soap”, “Universal Rest Easy Patent Chair ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Field of the Invention and use of Invention",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "The description should preferably begin with a general statement of the invention so as to indicate briefly the subject matter to which the invention relates, e.g. “This invention relates to …………………”. Thereafter, the advantages of the invention may be mentioned to bring out clearly the areas of application and preferable use of the invention. The applicant may substantiate industrial applicability of the invention in this part.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Prior Art and problem to be solved",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "This part should indicate the status of the technology in the field of invention with reference to developments in the field, patents and pending patent applications in the specific art. When the invention relates to an improvement on an existing product or process, a short statement of the closest prior art known to the applicant shall also be given. However, the description should fully and particularly describe the invention, by clearly distinguishing it from such a closest prior art, known to the applicant.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Objects / Objectives of the Invention ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "The purpose of this part is to clearly bring out the necessity of the invention. It shall clearly mention the technical problems associated with the existing technology and the solution for that, bringing out the differences between the claimed invention and the prior art. The solution sought by the invention should be clearly brought out as object(s) of inventions with statements like “It has already been proposed ………………” followed by the objects which the inventions has in view e.g “The principal object of this invention is ……………”, “Another object of this invention is ……………..”, “A further object of this invention is ………….” etc. ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Summary of the Invention",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "The description should include a summary of invention before giving the details of the invention and the method of performing it. The statement should clearly set forth the distinguishing novel features of the invention for which protection is desired. This part is intended to declare different aspects of the invention. ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Detailed Description of the Invention",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          " Description of an invention is required to be furnished in sufficient detail so as to give a complete picture of the invention and follows the Summary of invention. The nature of improvements or modifications effected with respect to the prior art should be clearly and sufficiently described. The details of invention described should be sufficient for a person skilled in the art to perform the invention. It may include examples / drawings or both for clearly describing and ascertaining the nature of invention. Examples must be included in the description, especially in the case of chemical related inventions. \n The details of invention described should enable a person skilled in the art to reduce the invention into practice without further experimentation. \n Reference to the drawings should be specific and preferably in the following form: “This invention is illustrated in the accompanying drawings, throughout which, like reference numerals indicate corresponding parts in the various figures. The Specication in respect of a Patent of Addition should contain at the beginning of thedescription, a definite statement indicating an improvement in or modification of, the original invention, and the serial number of the Application for Patent in respect of the original invention. The Specifications should also contain a short statement of the invention as disclosed in the earlier Specification.  Terms in other languages, if any, used in the description should be accompanied by their English equivalents. The use of vague slang, words and colloquialisms is objectionable and shall be avoided. \n When a biological material is described in the specification and when such material is not available to the public and cannot be described adequately as per the provisions of the Act, such material shall be deposited in order to make the application complete. The deposit shall be made with the International Depository Authority under the Budapest Treaty, on or before the date of filing (See the list here: http://ipindia.nic.in/ipr/patent/d_inst_456.pdf). The International Depository Authority in India is Microbial Type Culture Collection and Gene Bank (MTCC) – Chandigarh. For further information on Microbial Type Culture Collection and Gene Bank (MTCC) please visit: http://wdcm.nig.ac.jp/CCINFO/CCINFO.xml?773; http://www.imtech.res.in/mtcc.] \n Reference to such biological material shall be made in the Specification within three months from the date of filing, giving all the available characteristics of the materialrequired for it to be correctly identified or indicated including the name, address of the depository institution and the date and number of the deposit of the material at the institution. \n Further, the source and geographical origin of the biological material specified in the Specification shall also be disclosed. \n In the case of Biotechnology related inventions, relevant numbers of the sequence listing shall be mentioned at appropriate place in the specification. \n Sequence listing should also be given in electronic form. However, the fees with respect to the corresponding number of pages should be paid.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Drawings",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          " Drawings or sketches, which require a special illustration of the invention, shall not appear in the description itself. Such drawings shall be on separate sheet(s). \n Drawings shall be prepared neatly and clearly on durable paper sheet. \n Drawings shall be on standard A4 size sheets with a clear margin of at least 4 cm on the top and left hand and 3 cm at the bottom and right hand of every sheet. \n Drawings shall be on a scale sufficiently large to show the inventions clearly and dimensions shall not be marked on the drawings. \n Drawings shall be sequentially or systematically numbered and shall bear— o in the left hand top corner, the name of the applicant; o in the right hand top corner, the number of the sheets of drawings, and the consecutive number of each sheet; and o in the right hand bottom corner, the signature of the applicant or his agent. \n No descriptive matter shall appear on the drawings except in the flow diagrams. ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Claims",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Claims define the contours of rights, if and when a patent is granted for an invention. Hence, claims are the most critical part of a Patent Application. In a complete specification the description is followed by claims. Since, claims define the scope of legal protection, it is suggested that they should be drafted carefully to cover all the aspects of the protection being sought at the same time adequately distinguishing the prior art from the claimed invention. No exclusivity is obtained for any matter described in the Complete Specification unless it is claimed in the claims. What is not claimed in the ‘claims’stands disclaimed, and is open to public use, even if the matter is disclosed in the description. The claims shall define clearly the scope of the invention with conciseness, precision and accuracy, so that others may know the exact boundary into which they should not trespass. Each claim is evaluated on its own merit and, therefore, if one of the claims is objected, it does not mean that the rest oeclaims are invalid. It is therefore important to make claims on all aspects of the invention to ensure that the applicant gets the widest possible protection. ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Abstract",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          " Every complete specification shall be accompanied by an abstract to provide technical information on the invention. The abstract shall commence with the title of the invention. \n The abstract shall be so drafted that it constitutes an efficient instrument for the purposes of searching in the particular technical field, in particular by making it possible to assess whether there is a need to consult the specification itself. \n The abstract shall contain a concise summary of the matter contained in the specification. The summary shall indicate clearly the technical field to which the invention belongs, technical problem to which the invention relates and the solution to the problem through the invention and principal use or uses of the invention. Where necessary, the abstract shall contain the chemical formula, which characterizes the invention. \n The abstract may not contain more than one hundred and fifty words. If the specification contains any drawing, the applicant shall indicate on the abstract the figure, or exceptionally, the figures of the drawings which may accompany the abstract when published. Each main feature mentioned in the abstract and illustrated by a drawing shall be followed by the reference sign used in that drawing. \n The Controller may amend the abstract for providing better information to third parties.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
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
