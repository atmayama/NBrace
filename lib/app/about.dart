import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final String title =
      "This is an informational application designed by the NITTE University. It was made to communicate better to those interested in undergoing orthodontic treatment what to expect when the treatment begins as well as any modifications required in their routines when the treatment begins. The app also aids patients currently undergoing orthodontic treatment regarding doubts that could arise between consecutive visits to the orthodontist. The app aims to answer basic questions or doubts that a potential orthodontic patient/ their parent may have. We hope that this app is useful and provides those interested with adequate information.\n";
  final String description =
      "\tEstablished in the year 1985, the Department of Orthodontics and Dentofacial Orthopedics has been at the forefront in the field of Orthodontics involving itself in imparting quality education and delivering health care of the highest order. Equipped with state-of-the-art physical facilities, modern clinical equipment and materials, highly experienced faculty, the department offers A to Z treatment modalities available in the field of Orthodontics. The Department is recognised as one of the best and largest departments in terms of admissions, teaching and learning materials, infrastructure, the variety and number of cases being treated in the department.\nThe Department is located on the 5th floor of the A. B. Shetty Memorial Institute of Dental Sciences, with built up area of more than 10000 Sq. Ft\nKeeping pace with the technological advances, the department has been continuously upgrading itself to the use of Digital Technology in diagnosis and treatment planning. The recently installed one of its kind, 3Dimension simulation software along with CBCT soft wares and other recently procured digital gadgets are the major steps in this direction.\nThe department delivers comprehensive Orthodontic Management of Cleft Lip and Palate cases as well as other Craniofacial Disorders through team approach. The Smile Train Foundation, USA and the Cleft Child International (CCI), Switzerland fund the charitable Cleft Lip and Palate program, which treats more than 1000 cleft cases in a year\nThe faculty and the PG students are involved extensively in the research, publications and presentations at National and International forums. CDE and workshops are also conducted regularly.\nThe social concern of the department is reflected in the services provided at 11 rural centres where PG s and the Faculty are posted on an appointment basis.\n";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("About App"),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(12.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset("assets/flash_screen.jpg"),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline,
              textScaleFactor: 1.1,
              textAlign: TextAlign.center,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.subhead,
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
