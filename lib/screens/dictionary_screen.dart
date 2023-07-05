import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:untitled/screens/Augmentin_screen.dart';
import 'package:untitled/screens/main_screen.dart';
import '../constant/color.dart';

class DictionaryScreen extends StatefulWidget {
  DictionaryScreen({Key? key}) : super(key: key);
  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  List argumentlist = [
    {
      "Brand_name": "Aphthtab",
      "Generic_name": "Amlexanox 2mg",
      "Dosage_form": "assets/table.png",
      "Indication": "aphthous mouth ulcers. Gingivitis and tongue.",
      "contraindication":
          "Hypersensitivity to any of the components. Children and adolescents under 16 years of age",
      "Pregnancy_and_lactation": "no studies on the safety of use"
    },
    {
      "Brand_name": "Mundisal",
      "Generic_name": "Cetalkonium+ choline salicylate",
      "Dosage_form": "assets/gel.jpg",
      "Indication":
          "For pain and inflammation, injuries and ulcers in the mouth, nose and throat, such as pressure and sores caused by dentures and orthodontic devices, teething problems.",
      "contraindication":
          "Children and adolescents under 16 years of age. * Allergy to salicylates, eg aspirin. * Active peptic ulcer",
      "Pregnancy_and_lactation": "no studies on the safety of use"
    },
    {
      "Brand_name": "Oracure",
      "Generic_name": "Cetylpyridiniu m chlorine+lidoc aine",
      "Dosage_form": "assets/gel.jpg",
      "Indication":
          "all infections that occur in the mouth, gums and lips, which are like ulcers in the mouth of the phillot.",
      "contraindication":
          "allergy to lidocaine and other drugs and other topical drugs.",
      "Pregnancy_and_lactation": " "
    },
    {
      "Brand_name": "Hexitol",
      "Generic_name": "chlorhexidine",
      "Dosage_form": "assets/mouth_wash.jpg",
      "Indication":
          "For antisepsis of clean and surgical hand to prevent infections: Mucositis, Oral Aphthous Ulcer, Oral Infection, Chronic Wounds, Decubitus Ulcer. Gingivitis. infectious Periodontal Diseases, Injury Throat, Mild to Moderate Inflammatory Reaction of the Oral Cavity",
      "contraindication": "Hypersensitivity",
      "Pregnancy_and_lactation": "Pregnancy Category B"
    },
    {
      "Brand_name": "Salivex-l ",
      "Generic_name": "Anthraquinon e glycoside + lidocaine + salicylic acid",
      "Dosage_form": "assets/mouth_wash.jpg",
      "Indication":
          "– Acute and chronic inflammations of mucous membranes of mouth and throat. – Aphthous stomatitis. – Alveolar pyorrhea. – Teething troubles – As an adjuvantln the treatment of pharyngitis and of Vincent’s angina ( Vincent’s infection)",
      "contraindication":
          "Hypersensitivity to any of the components of this medication",
      "Pregnancy_and_lactation": "Information not available."
    },
    {
      "Brand_name": "Betadine",
      "Generic_name": "povidone iodine",
      "Dosage_form": "assets/mouth_wash.jpg",
      "Indication":
          "used for the treatment of acute infections of the lining of the mouth and throat, for example, inflammation of the gums (gingivitis) and mouth ulcers. For cleansing the mouth (oral hygiene) before, during and after dental and mouth surgery",
      "contraindication":
          "allergic to povidone iodine -thyroid problem -lithium therapy for depression -on children of 6 years and under",
      "Pregnancy_and_lactation":
          "should only be used if strictly prescribed by the doctor and its use should be kept to the absolute minimum. Absorbed iodine can cross the placental barrier and can be secreted in breast milk."
    },
    {
      "Brand_name": "Miconaz",
      "Generic_name": "Miconazole 2%",
      "Dosage_form": "assets/gel.jpg",
      "Indication":
          "medicine which is used to treat fungal infections of the mouth, throat and gullet",
      "contraindication":
          "- children under 6 months or patients with swallowing difficulties (risk of suffocation due to oral gel form); -in patients with hepatic impairment. -Do not combine with antivitamin K agents (risk of haemorrhage), glibenclamide (increased hypoglycaemic effect), phenytoin (increased plasma concentration of phenytoin). May cause: nausea, taste disturbances. ",
      "Pregnancy_and_lactation":
          "Pregnancy: Contraindicated/ lack of data in pregnant woman Lactation : May be acceptable Use with caution"
    },
    {
      "Brand_name": "Maalox plus",
      "Generic_name": "Aluminium hydroxide + magnesium hydroxide +simethicone ",
      "Dosage_form": "assets/table.png",
      "Indication": "Treat heart burn and upset stomach ",
      "contraindication":
          "Shouldn’t be used in patients who are severly diabilitated or suffering from severe abdominal pain or possible bowel obstruction",
      "Pregnancy_and_lactation": "Safe category B"
    },
    {
      "Brand_name": "Gaviscon",
      "Generic_name":
          "Sodium alginate500m g+ sodium bicarbonate267mg + calcium carbonate160 mg",
      "Dosage_form": "assets/gaviscon.png",
      "Indication": "Treat heart burn (GERD) – indigestion ",
      "contraindication":
          "Hypersensitivity Not used for treat peptic ulcer If sodium and magnesium restricted ask the pharmacist prior to take medication In renal disease",
      "Pregnancy_and_lactation": "Category C"
    },
    {
      "Brand_name": "Antodine",
      "Generic_name": "Famotidine",
      "Dosage_form": "assets/table.png",
      "Indication":
          "Short term treatment of active duodenal ulcer, GERD and Heart Burn -Maintenance therapy for duodenal ulcer patients at reduced dosage after healing of an active ulcer -Short term treatment of active benign gastric ulcer -Treatment of pathological hypersecretory conditions (e.g., Zollinger-Ellison Syndrome, multiple endocrine adenomas)",
      "contraindication":
          "-Hypersensitivity to Famotidine (H2 Antagonist) -Used in caution in moderate to severe renal impairment ",
      "Pregnancy_and_lactation":
          "-Pregnancy: Category B -Lactation: Avoided as secreted in breastfeedin g"
    },
    {
      "Brand_name": "Tagamet",
      "Generic_name": "Cimetidine hydrochloride",
      "Dosage_form": "assets/table.png",
      "Indication":
          "Relieves heartburn associated with acid indigestion and sour stomach",
      "contraindication": "Hypersensitivity to cimetidine or H2 antagonists",
      "Pregnancy_and_lactation":
          "Pregnancy: Category B -Lactation: Avoided as secrete in breast milk"
    },
    {
      "Brand_name": "Nizatect",
      "Generic_name": "Nizatidine",
      "Dosage_form": "assets/table.png",
      "Indication":
          "- GERD -Gastric Ulcer, Duodenal Ulcer (active & for suppression) -Heartburn, acid indigestion , sour stomach due to over indulgence",
      "contraindication": "Hypersensitivity to Nizatect or H2 antagonist",
      "Pregnancy_and_lactation":
          "-Pregnancy: Category B -Lactation: Avoided as secreted in breast milk"
    },
    {
      "Brand_name": "Controloc",
      "Generic_name": "Pantoprazole",
      "Dosage_form": "assets/table.png",
      "Indication":
          "Short-term treatment of reflux symptoms (e.g. heartburn, acid regurgitation) in adults",
      "contraindication":
          "-not used in combination for ttt H-pylori for hepatic or kidney failure. ",
      "Pregnancy_and_lactation":
          "-Not recommended in pregnancy and breastfeeding"
    },
    {
      "Brand_name": "Omez",
      "Generic_name": "Omeprazole",
      "Dosage_form": "assets/table.png",
      "Indication":
          "-Active duodenal ulcer -Helicobacter eradication -severe erosive esophagitis-GERD & Heart Burn-Hypersecretory conditions (ZollingerEllison Syndrome)",
      "contraindication":
          "-Hypersensitivity to Omeprazole -Taken with H2 Antagonist",
      "Pregnancy_and_lactation":
          "-Not recommended for Pregnancy and Breastfeeding"
    },
    {
      "Brand_name": "Imodium",
      "Generic_name": "Loperamide",
      "Dosage_form": "assets/table.png",
      "Indication":
          "tab Loperamide is amedicine to treat diarrhoea (runny poo). It can help with shortterm diarrhoea or irritable bowel syndrome (IBS)",
      "contraindication":
          "Loperamide is not suitable for some people: have severe diarrhoea after taking antibiotics-are having a flare-up of an inflammatory bowel condition like ulcerative colitis",
      "Pregnancy_and_lactation":
          "-Loperamide is not usually recommended in pregnancy. -It is OK to take loperamide for a couple of days while you're breastfeeding"
    },
    {
      "Brand_name": "Kapect",
      "Generic_name": "Kaolin and pectin",
      "Dosage_form": "assets/susp.png",
      "Indication":
          "Kaolin is used to stop bleeding and for a condition that involves swelling and sores in the mouth (oral mucositis). It is also used for diarrhea",
      "contraindication":
          "avoid taking kaolin with drugs that chelate with aluminum",
      "Pregnancy_and_lactation":
          "Pregnancy and breast-feeding: Kaolin is LIKELY SAFE"
    },
    {
      "Brand_name": "lomotil",
      "Generic_name": "Diphenoxylate/atropine",
      "Dosage_form": "assets/table.png",
      "Indication":
          "Diphenoxylate is a centrally active opioid drug of the phenylpiperidine series that is used as acombination drug with atropine for the treatment of diarrhea. Diphenoxylate is an opioid and acts by slowing intestinal contractions; the atropine is present to prevent drug abuse and overdose",
      "contraindication":
          "-intestine infection due to the Shigella bacteria. -diarrhea from an infection with Clostridium difficile bacteria.",
      "Pregnancy_and_lactation":
          "Lomotil not recommended with lactation, pregnancy"
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  void getdata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int idlist = prefs.getInt("id") ?? 0;

    setState(() {
      idsubject = idlist;
    });
  }

  int idsubject = 0;

  bool isSearchEmpty = true;
  String searchQuery = '';
  List<dynamic> searchResult = [];
  void onSearchTextChanged(String value) {
    setState(() {
      searchQuery = value.toLowerCase();
      if (searchQuery.isEmpty) {
        // إذا كان حقل البحث فارغًا، فعرض جميع النتائج
        searchResult = [];
        isSearchEmpty = true;
      } else {
        // إذا كان هناك نص مدخل، فقم بتحديث النتائج الناتجة عن البحث
        searchResult = argumentlist
            .where((document) =>
                document['Brand_name'].toLowerCase().contains(searchQuery))
            .toList();
        isSearchEmpty = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image(
        width: double.infinity,
        image: AssetImage('assets/images/background.png'),
        fit: BoxFit.fill,
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => MainScreen(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            width: 50,
            height: 50,
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      Padding(
          padding: EdgeInsets.only(top: 150),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: Image(
                            image: AssetImage('assets/images/dictionary.png'),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        GradientText(
                          "Dictionary",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          colors: [
                            firstMainColor,
                            secondMainColor,
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  getdata();
                                });
                              },
                              icon: Icon(
                                Icons.restore_page,
                                size: 45,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      child: TextFormField(
                        onChanged: onSearchTextChanged,
                        onSaved: (value) {},
                        decoration: InputDecoration(
                          label: Text(
                            "Augme",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            size: 30,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF764BA2),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (BuildContext context, index) {
                        final document = argumentlist[idsubject];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                              onTap: () async {
                                SharedPreferences.getInstance().then((prefs) {
                                  prefs.setInt("id", index);
                                  print(index);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => AugmentinScreen(
                                          Brand_name: document['Brand_name'],
                                          Generic_name:
                                              document['Generic_name'],
                                          Indication: document['Indication'],
                                          contraindication:
                                              document['contraindication'],
                                          Pregnancy_and_lactation: document[
                                              'Pregnancy_and_lactation']),
                                    ),
                                  );
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFF764BA2))),
                                child: ListTile(
                                  leading: Image(
                                    image: AssetImage(
                                        "${document['Dosage_form']}"),
                                  ),
                                  title: Row(
                                    children: [
                                      GradientText("${document['Brand_name']}",
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          colors: [
                                            firstMainColor,
                                            secondMainColor,
                                          ]),
                                    ],
                                  ),
                                  subtitle: Text(
                                    "${document['Generic_name']}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              )),
                        );
                      },
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: searchResult.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (isSearchEmpty) {
                          return SizedBox.shrink();
                        }

                        final document = searchResult[index];
                        final originalIndex = argumentlist.indexOf(document);
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () async {
                              SharedPreferences.getInstance().then((prefs) {
                                prefs.setInt("id",
                                    originalIndex); // استخدام originalIndex بدلاً من index
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => AugmentinScreen(
                                      Brand_name: document['Brand_name'],
                                      Generic_name: document['Generic_name'],
                                      Indication: document['Indication'],
                                      contraindication:
                                          document['contraindication'],
                                      Pregnancy_and_lactation:
                                          document['Pregnancy_and_lactation'],
                                    ),
                                  ),
                                );
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF764BA2)),
                              ),
                              child: ListTile(
                                leading: Image(
                                  image:
                                      AssetImage("${document['Dosage_form']}"),
                                ),
                                title: Row(
                                  children: [
                                    GradientText(
                                      "${document['Brand_name']}",
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      colors: [firstMainColor, secondMainColor],
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  "${document['Generic_name']}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    if (searchResult.isEmpty && searchQuery.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("No results found."),
                      )
                  ]))))
    ]));
  }
}
