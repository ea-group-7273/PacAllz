import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3a57e8),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xffffffff),
                        size: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Privacy Policy",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 25,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
              padding: EdgeInsets.all(0),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0)),
                border: Border.all(color: Color(0x4d9e9e9e), width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 60, 16, 16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "PLEASE READ THE FOLLOWING PRIVACY POLICY CAREFULLY:\n\nLast updated April 04, 2024\n\nPacAllz and EA Group, Inc. (“we,” “our,” and/or “us”) values the privacy of individuals who use our Service (as defined in our Terms of Service). This privacy policy (the “Privacy Policy”) explains how we collect, use, and share information from users of the Service (“Users”) or their devices. By using or accessing the Service, you agree to the collection, use, disclosure, sharing, and procedures this Privacy Policy describes. Beyond the Privacy Policy, your use of the Service is also subject to our Terms of Service.\n\nInformation We Collect\n\nWe collect a variety of information from or about you or your devices from various sources, as described below.\nA. Information You Provide to Us \n\nRegistration and Account Information. \n\nWhen you register for the Service, we ask for your name, email, member password, as well as dietary and food allergy information. If you sign up using a social media account, we may also receive information from that social media service.\n\nCommunications. \n\nWhen you communicate with us, we may receive additional information about you. For example, when you communicate with our Customer Support Team, we will receive information such as your name, email address, the contents of a message or attachments that you may send to us, and other information you choose to provide. When we send you emails, we may track whether you open them to learn how to deliver a better customer experience and improve our Services.\n\nB. Information We Collect When You Use the Service\n\nDevice Information. \n\nWe receive information about the device you use to access the Service, including, internet protocol (“IP”) address, web browser type, operating system version, and information about your device.\n\nUsage Information. \n\nTo help us understand how you use the Service and to help us improve them, when you use the Service, we automatically receive information about your interactions with the Service, including information about your use of the App, such as time spent using the App, how you interact with elements of the App, the products you scan and lists you create.\n\nLocation Information. \n\nWhen you use the Service, we infer the general physical location of your device and the geographic regions our Users come from. For example, your IP address may indicate your general geographic region.\n\nCamera Access. \n\nWhen you use the Service, we will request access to your device’s camera to enable you to scan product barcodes, upload product photos, or use other features of our Service.\n\nInformation from Cookies and Similar Technologies. \n\nWe and third-party partners collect information using cookies, pixel tags, or similar technologies. Our third-party partners, such as analytics and advertising partners, may use these technologies to collect information about your online activities over time and across different services. Cookies are small text files containing a string of alphanumeric characters. We may use both session cookies and persistent cookies. A session cookie disappears after you close your browser. A persistent cookie remains after you close your browser and may be used by your browser on subsequent visits to the Service.\n\nPlease review your web browser’s “Help” file to learn the proper way to modify your cookie settings. Please note that if you delete or choose not to accept cookies from the Service, you may not be able to utilize the features of the Service to their fullest potential.\n\nUser feedback. \n\nWe receive information you provide if you share feedback about the accuracy of ingredients in products, products or ingredients not recognized by us, food and ingredient ratings we make, and our performance.\n\nHow We Use the Information We Collect\n\nWe use the information we collect:\n\n•	To provide, maintain, improve, and enhance the Service; \n\n•	To communicate with you, provide you with updates and other information relating to the Service, provide information that you request, respond to comments and questions, and otherwise provide customer support; \n\n•	To understand and analyse how you use the Service and develop new products, services, and features; \n\n•	For marketing purposes, such as communicating updates about the Service that may be of interest to you; \n\n•	To de-identify and/or aggregate information collected through the Service for our business purposes; \n\n•	To facilitate transactions and payments;\n\n•	To find and prevent fraud, and respond to trust and safety issues that may arise; \n\n•	For compliance purposes, including enforcing our Terms of Service or other legal rights, or as may be required by applicable laws and regulations or requested by any judicial process or governmental agency; and \n\n•	For other purposes for which we provide specific notice at the time the information is collected.\n\nHow We Share the Information We Collect\n\nWe may share or otherwise disclose information we collect from or about you as described below or otherwise disclosed to you at the time of collection.\n\nAffiliates. \n\nWe may share any information we receive with our corporate affiliates for any of the purposes described in this Privacy Policy.\n\nService Providers. \n\nWe may share any information we receive with contractors, service providers and other third parties retained in connection with the provision of the Service.\n\nAnalytics Partners. \n\nWe use analytics services such as Google Analytics to collect and process certain analytics data. These services may also collect information about your use of other websites, apps, and online resources. You can learn about Google’s practices by going to https://www.google.com/policies/privacy/partners/, and opt-out of them by downloading the Google Analytics opt-out browser add-on, available at https://tools.google.com/dlpage/gaoptout.\n\nAs Required by Law and Similar Disclosures. \n\nWe may access, preserve, and disclose information about you if we believe doing so is required or appropriate to: (a) comply with law enforcement requests and legal process, such as a court order or subpoena; (b) comply with requests from auditors, examiners, or other regulators; (c) respond to your requests; or (d) protect your, our, or others’ rights, property, or safety. \n\nMerger, Sale, or Other Asset Transfers.\n\nWe may disclose and transfer information about you to service providers, advisors, potential transactional partners, or other third parties in connection with the consideration, negotiation, or completion of a corporate transaction in which we are acquired by or merged with another company or we sell, liquidate, or transfer all or a portion of our business or assets.\n\nAt Your Direction.\n\nWe may disclose information about you to fulfil the purpose for which you provide it. \n\nMarketing Communications.\n\nYou can unsubscribe from our promotional emails via the link provided in the emails. Even if you opt out of receiving promotional messages from us, you will continue to receive administrative messages from us.\n\nDo Not Track.\n\nThere is no accepted standard on how to respond to Do Not Track signals, and we do not respond to such signals.\n\nDeletion of your information.\n\nYou have the right to ask us to delete personal information about you if it no longer is required for the purpose it was collected, you have withdrawn your consent, or you have a valid objection to us using your personal information. You may request deletion of your personal information by emailing us to eagroup7273@gmail.com.\n\nThird Parties\n\nThe Service may contain links to other websites, products, or services that we do not own or operate. Please be aware that this Privacy Policy does not apply to your communications with third parties or your activities on any third-party services or any information you disclose to third parties. We are not responsible for the privacy practices or the content of third parties or third-party sites. If you have any questions about how third parties or third-party sites use information from or about you, you should contact them directly. We encourage you to read their privacy policies before providing any information to them. \n\nSecurity\n\nWe make reasonable efforts to protect information from or about you by using technical and organizational safeguards designed to improve the security of the information we maintain. However, as the Service is hosted electronically, we can make no guarantees as to the security or privacy of your information.\n\nChildren’s Privacy\n\nWe do not knowingly collect, maintain, or use personal information from children under 13 years of age, and no part of the Service is directed to children. If you learn that a child has provided us with personal information in violation of this Privacy Policy, then you may alert us at eagroup7273@gmail.com.\n\nInternational Visitors\n\nThe Service is hosted in the India and intended for visitors located within India. If you choose to use the Service from the European Union or other regions of the world with laws governing data collection and use that may differ from Indian law, then please note that you are transferring information from or about you or your devices outside of those regions to India for storage and processing. Also, we may transfer your data from India to other countries or regions in connection with storage and processing of data, fulfilling your requests, and operating the Service. By providing any information, including information from or about you or your devices, on or to the Service, you consent to such transfer, storage, and processing.\n\nUpdate Information \n\nYou can update information your account and profile information by logging in to your account on the Service. \n\nChanges to This Privacy Policy\n\nThis Privacy Policy may be revised from time to time. We will post any adjustments to the Privacy Policy on this page, and the revised version will be effective as of the last updated date below. If we materially change the ways in which we use or share information from or about you or your devices previously collected from you through the Service, we will make reasonable efforts to notify you of the changes by sending a notice to the primary email address provided to us and/or by placing a notice on the Service.\n\nContact Information \n\nIf you have any questions, comments, or concerns about our processing activities, please email us at eagroup7273@gmail.com.\n\nLast Updated: April 04, 2024",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                    ],
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

void main() {
  runApp(MaterialApp(
    home: PrivacyPolicyPage(),
  ));
}
