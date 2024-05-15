import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
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
                      "Terms And Conditions",
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
                        'PLEASE READ THE FOLLOWING TERMS CAREFULLY:\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'BY CLICKING “I ACCEPT,” OR BY DOWNLOADING, INSTALLING, OR OTHERWISE ACCESSING OR USING THE SERVICE, YOU AGREE THAT YOU HAVE READ AND UNDERSTOOD, AND, AS A CONDITION TO YOUR USE OF THE SERVICE, YOU AGREE TO BE BOUND BY, THE FOLLOWING TERMS AND CONDITIONS, INCLUDING PACALLZ’S PRIVACY POLICY (TOGETHER, THESE “TERMS”). IF YOU ARE NOT ELIGIBLE, OR DO NOT AGREE TO THE TERMS, THEN YOU DO NOT HAVE OUR PERMISSION TO USE THE SERVICE. YOUR USE OF THE SERVICE, AND OUR PROVISION OF THE SERVICE TO YOU, CONSTITUTES AN AGREEMENT BY PACALLZ AND BY YOU TO BE BOUND BY THESE TERMS.\n',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'YOU AGREE TO RECEIVE TEXTS/CALLS FROM OR ON BEHALF OF PACALLZ AT THE PHONE NUMBER YOU PROVIDE TO US. THESE TEXTS/CALLS WILL INCLUDE INFORMATION TO ASSIST YOU IN DOWNLOADING OUR APPLICATION. YOU UNDERSTAND AND AGREE THAT THESE TEXTS/CALLS MAY BE CONSIDERED TELEMARKETING UNDER APPLICABLE LAW, THEY MAY BE SENT USING AN AUTOMATIC TELEPHONE DIALING SYSTEM OR OTHER AUTOMATED TECHNOLOGY, AND YOUR CONSENT IS NOT A CONDITION OF ANY PURCHASE.\n',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Arbitration NOTICE. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Except for certain kinds of disputes described in Section 17, you agree that disputes arising under these Terms will be resolved by binding, individual arbitration, and BY ACCEPTING THESE TERMS, YOU AND PACALLZ ARE EACH WAIVING THE RIGHT TO A TRIAL BY JURY OR TO PARTICIPATE IN ANY CLASS ACTION OR REPRESENTATIVE PROCEEDING.',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        '\n1. Service Overview. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'The Service provides certain educational content to help users make more informed decisions in their food and dining choices, such as nutrition and labelling information. The SERVICE IS FOR INFORMATIONAL PURPOSES AND IS INTENDED TO BE USED IN CONNECTION WITH A USER’S GENERAL WELLNESS ONLY. IT IS NOT INTENDED TO PROVIDE MEDICAL ADVICE OF ANY KIND OR SERVE AS A SUBSTITUTE FOR PROFESSIONAL MEDICAL ADVICE, DIAGNOSIS OR TREATMENT. ALWAYS CONSULT WITH YOUR PHYSICIAN OR A QUALIFIED MEDICAL PROVIDER FOR ANY QUESTIONS RELATING TO YOUR DIETARY HEALTH. The Service also provides tools (such as a browser extension (for desktop users) and mobile applications) that allow users to tailor their browsing, shopping, and dining experience based on their settings and input (including dietary restrictions or preferences), access ingredient and other information about the foods that the user is interested in, and input certain contextual annotations.',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        '\n2.Eligibility. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'You must be at least 18 years old to use the Service. By agreeing to these Terms, you represent and warrant to us that: (a) you are at least 18 years old; (b) you have not previously been suspended or removed from the Service; and (c) your registration and your use of the Service is in compliance with any and all applicable laws and regulations. If you are an entity, organization, or company, the individual accepting these Terms on your behalf represents and warrants that they have authority to bind you to these Terms and you agree to be bound by these Terms.',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        '\n3.Accounts; Partner Users\n\n3.1 Accounts. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'To access most features of the Service, you must register for an account. When you register for an account, you must provide us with some information about yourself, such as your name, email address, or your account information on a third-party service (e.g., Google). You agree that the information you provide to us is accurate, complete, and not misleading, and that you will keep it accurate and up to date at all times. When you register, you will be asked to create a password. You are solely responsible for maintaining the confidentiality of your account and password, and you accept responsibility for all activities that occur under your account. If you believe that your account is no longer secure, then you must immediately notify us at eagroup7273@gmail.com.',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        '\n3.2 Partner Users. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'We also partner with organizations to provide individuals at those organizations with an improved food selection and dining experience. If you are affiliated with one of our partner organizations and register for an account using your organization’s email, subject to these Terms, you may have access to a version of the Service that is specific for your organization under your account.',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        '\n4.Licenses\n\n4.1 Limited License. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Subject to your complete and ongoing compliance with these Terms, PacAllz grants you, solely for your personal, non-commercial use, a limited, non-exclusive, non-transferable, non-sublicensable, revocable license to: (a) install and use one object code copy of any downloadable application we make available to you (including the right to install and use one object code copy of the mobile application associated with the Service on a mobile device that you own or control, and the right to install and use one object code copy of the browser extension associated with the Service on a desktop computer you own or control); and (b) access and use the Service.',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        '\n4.2 License Restrictions. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Except and solely to the extent such a restriction is impermissible under applicable law, you may not: (a) reproduce, distribute, publicly display, publicly perform, or create derivative works of the Service; (b) make modifications to the Service; or (c) interfere with or circumvent any feature of the Service, including interfering with any security features or access control mechanism, disabling or circumventing features that prevent or limit use or copying of any Materials or other content, and reverse engineering or otherwise attempting to discover the source code of any portion of the Service. If you are prohibited under applicable law from using the Service, then you may not use it.',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        '\n4.3 Feedback. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'If you choose to provide input and suggestions regarding problems with or proposed modifications or improvements to the Service (“Feedback”), then you hereby grant us an unrestricted, perpetual, irrevocable, non-exclusive, fully-paid, royalty-free right and license to exploit the Feedback in any manner and for any purpose, including to improve the Service and create other products and services. We will have no obligation to provide you with attribution for any Feedback you provide to us.',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        '\n5.Ownership; Proprietary Rights. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'The Service is owned and operated by PacAllz. The visual interfaces, graphics, design, compilation, information, data, computer code (including source code or object code), products, software, services, and all other elements of the Service (“Materials”) provided by us are protected by intellectual property and other laws. All Materials included in the Service are the property of PacAllz or the third-party rights owners of such Materials. You may not make use of the Service, including the Materials, except as expressly authorized by us in these Terms or as otherwise permitted by law. There are no implied licenses in these Terms and we reserve all rights to the Service, including the Materials (to the extent of our rights in the Materials), not granted expressly in these Terms.',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        '\n6.Third-Party Terms\n\n6.1 Third-Party Services. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'We may provide tools through the Service that enable you to export information, including User Content (as defined below), to third-party services. By using one of these tools, you hereby authorize that we may transfer that information to the applicable third-party service. Third-party services are not under our control, and, to the fullest extent permitted by law, we are not responsible for any third-party service’s use of your exported information.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        '\n6.2 Third-Party Software. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'The Service may include or incorporate third-party software components that are generally available free of charge under licenses granting recipients broad rights to copy, modify, and distribute those components (“Third-Party Components”). Although the Service is provided to you subject to these Terms, nothing in these Terms prevents, restricts, or is intended to prevent or restrict you from obtaining Third-Party Components under the applicable third-party licenses or to limit your use of Third-Party Components under those third-party licenses.',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        '\n7.Term, Termination, and Modification of the Service\n\n7.1 Term. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'These Terms are effective beginning when you accept the Terms or first download, install, access, or use the Service, and ending when terminated as described in Section 7.2.',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        '\n7.2 Termination. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'If you violate any provision of these Terms, then your authorization to access the Service and these Terms automatically terminate. In addition, we may, at our sole discretion, terminate these Terms or your account on the Service, or suspend or terminate your access to the Service, at any time for any reason or no reason, with or without notice, and without any liability to you arising from such termination. You may terminate your account and these Terms at any time by contacting customer service at eagroup7273@gmail.com.',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        '\n7.3 Effect of Termination. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Upon termination of these Terms: (a) your license rights will terminate and you must immediately cease all use of the Service; (b) you will no longer be authorized to access your account or the Service. You are solely responsible for retaining copies of any User Content you Post to the Service since upon termination of your account, you may lose access rights to any User Content you Posted to the Service. If your account has been terminated for a breach of these Terms, then you are prohibited from creating a new account on the Service using a different name, email address or other forms of account verification.',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        '\n7.4 Modification of the Service. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'We reserve the right to modify or discontinue all or any portion of the Service at any time (including by limiting or discontinuing certain features of the Service), temporarily or permanently, without notice to you. We will have no liability for any change to the Service for functionalities of the Service, or any suspension or termination of your access to or use of the Service. You should retain copies of any User Content you Post to the Service so that you have permanent copies in the event the Service is modified in such a way that you lose access to User Content you Posted to the Service.',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        '\n8.Indemnity. ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                          'To the fullest extent permitted by law, you are responsible for your use of the Service, and you will defend and indemnify PacAllz, its affiliates and their respective shareholders, directors, managers, members, officers, employees, consultants, and agents (together, the “PacAllz Entities”) from and against every claim brought by a third party, and any related liability, damage, loss, and expense, including attorneys’ fees and costs, arising out of or connected with: (a) your unauthorized use of, or misuse of, the Service; (b) your violation of any portion of these Terms, any representation, warranty, or agreement referenced in these Terms, or any applicable law or regulation; (c) your violation of any third-party right, including any intellectual property right or publicity, confidentiality, other property, or privacy right; or (d) any dispute or issue between you and any third party. We reserve the right, at our own expense, to assume the exclusive defence and control of any matter otherwise subject to indemnification by you (without limiting your indemnification obligations with respect to that matter), and in that case, you agree to cooperate with our defence of those claims.',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.0)),
                      Text('\n9.Disclaimers; No Warranties by PacAllz\n\n9.1 ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'THE SERVICE AND ALL MATERIALS AND CONTENT AVAILABLE THROUGH THE SERVICE ARE PROVIDED “AS IS” AND ON AN “AS AVAILABLE” BASIS. PACALLZ DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, RELATING TO THE SERVICE AND ALL MATERIALS AND CONTENT AVAILABLE THROUGH THE SERVICE, INCLUDING: (A) ANY IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE, QUIET ENJOYMENT, OR NON-INFRINGEMENT; AND (B) ANY WARRANTY ARISING OUT OF COURSE OF DEALING, USAGE, OR TRADE. PACALLZ DOES NOT WARRANT THAT THE SERVICE OR ANY PORTION OF THE SERVICE, OR ANY MATERIALS OR CONTENT OFFERED THROUGH THE SERVICE, WILL BE UNINTERRUPTED, SECURE, OR FREE OF ERRORS, VIRUSES, OR OTHER HARMFUL COMPONENTS, AND PACALLZ DOES NOT WARRANT THAT ANY OF THOSE ISSUES WILL BE CORRECTED.',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.0)),
                      Text('\n9.2',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'NO ADVICE OR INFORMATION, WHETHER ORAL OR WRITTEN, OBTAINED BY YOU FROM THE SERVICE OR PACALLZ ENTITIES OR ANY MATERIALS OR CONTENT AVAILABLE THROUGH THE SERVICE WILL CREATE ANY WARRANTY REGARDING ANY OF THE PACALLZ ENTITIES OR THE SERVICE THAT IS NOT EXPRESSLY STATED IN THESE TERMS. WE ARE NOT RESPONSIBLE FOR ANY DAMAGE THAT MAY RESULT FROM THE SERVICE AND YOUR DEALING WITH ANY OTHER SERVICE USER. YOU UNDERSTAND AND AGREE THAT YOU USE ANY PORTION OF THE SERVICE AT YOUR OWN DISCRETION AND RISK, AND THAT WE ARE NOT RESPONSIBLE FOR ANY DAMAGE TO YOUR PROPERTY (INCLUDING YOUR COMPUTER SYSTEM OR MOBILE DEVICE USED IN CONNECTION WITH THE SERVICE) OR ANY LOSS OF DATA, INCLUDING USER CONTENT.',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.0)),
                      Text('\n9.3',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'PACALLZ DOES NOT PROVIDE ANY MEDICAL OR PROFESSIONAL DIETITIAN OR NUTRITIONIST SERVICES OR ADVICE. ALL INFORMATION AND SERVICES PROVIDED BY PACALLZ ARE NOT INTENDED TO BE A SUBSTITUTE FOR ANY PROFESSIONAL SERVICE OR ADVICE. YOU SHOULD NOT DISREGARD THE ADVICE FROM A HEALTHCARE PROFESSIONAL OR DELAY IN SEEKING PROFESSIONAL ADVICE BECAUSE OF YOUR USE OF THE SERVICE. ALL INFORMATION AND SERVICES PROVIDED BY PACALLZ ARE INTENDED FOR GENERAL INFORMATIONAL PURPOSES ONLY. PACALLZ DOES NOT WARRANT THE ACCURACY, COMPLETENESS, RELIABILITY, OR USEFULNESS OF ANY INFORMATION OR CONTENT PROVIDED ON OR THROUGH SERVICE, INCLUDING INFORMATION OR CONTENT OBTAINED FROM ANY THIRD PARTY, USERS OF PACALLZ, OR PUBLIC DATABASE. YOU ACKNOWLEDGE AND AGREE THAT NONE OF THE INFORMATION OR CONTENT PROVIDED BY OR THROUGH PACALLZ OR THE SERVICE HAS THE ABILITY TO DIAGNOSE, PRESCRIBE, OR PERFORM ANY TASK THAT CONSTITUTES THE PRACTICE OF MEDICINE OR PROFESSIONAL DIETITIAN OR NUTRITIONIST SERVICE OR ADVICE. IF YOU RELY ON ANY DATA OR INFORMATION OBTAINED THROUGH PACALLZ OR THE SERVICE, YOU DO SO AT YOUR OWN RISK. YOU ARE SOLELY RESPONSIBLE FOR ANY DAMAGE OR LOSS THAT RESULTS FROM YOUR USE OF SUCH DATA OR INFORMATION. IF YOU SUSPECT THAT YOU MAY HAVE A MEDICAL EMERGENCY, SEEK MEDICAL ATTENTION OR CALL 112 IMMEDIATELY.',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.0)),
                      Text('\n9.4',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'THE LIMITATIONS, EXCLUSIONS, AND DISCLAIMERS IN THIS SECTION 15 APPLY TO THE FULLEST EXTENT PERMITTED BY LAW. We do not disclaim any warranty or other right that we are prohibited from disclaiming under applicable law.',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.0)),
                      Text('\n10. Limitation of Liability\n\n10.1',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'TO THE FULLEST EXTENT PERMITTED BY LAW, IN NO EVENT WILL THE PACALLZ ENTITIES BE LIABLE TO YOU FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL OR PUNITIVE DAMAGES (INCLUDING DAMAGES FOR LOSS OF PROFITS, GOODWILL, OR ANY OTHER INTANGIBLE LOSS) ARISING OUT OF OR RELATING TO YOUR ACCESS TO OR USE OF, OR YOUR INABILITY TO ACCESS OR USE, THE SERVICE OR ANY MATERIALS OR CONTENT ON THE SERVICE, WHETHER BASED ON WARRANTY, CONTRACT, TORT (INCLUDING NEGLIGENCE), STATUTE, OR ANY OTHER LEGAL THEORY, AND WHETHER OR NOT ANY PACALLZ ENTITY HAS BEEN INFORMED OF THE POSSIBILITY OF DAMAGE.',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.0)),
                      Text('\n10.2',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'EACH PROVISION OF THESE TERMS THAT PROVIDES FOR A LIMITATION OF LIABILITY, DISCLAIMER OF WARRANTIES, OR EXCLUSION OF DAMAGES IS INTENDED TO AND DOES ALLOCATE THE RISKS BETWEEN THE PARTIES UNDER THESE TERMS. THIS ALLOCATION IS AN ESSENTIAL ELEMENT OF THE BASIS OF THE BARGAIN BETWEEN THE PARTIES. EACH OF THESE PROVISIONS IS SEVERABLE AND INDEPENDENT OF ALL OTHER PROVISIONS OF THESE TERMS. THE LIMITATIONS IN THIS SECTION 16 WILL APPLY EVEN IF ANY LIMITED REMEDY FAILS OF ITS ESSENTIAL PURPOSE.',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.0)),
                      Text(
                          '\n11. Dispute Resolution and Arbitration\n\n11.1 Generally. ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'In the interest of resolving disputes between you and PacAllz in the most expedient and cost-effective manner, and except as described in Section 11.2, you and PacAllz agree that every dispute arising in connection with these Terms, the Service, or communications from us will be resolved through binding arbitration. Arbitration uses a neutral arbitrator instead of a judge or jury, is less formal than a court proceeding, may allow for more limited discovery than in court, and is subject to very limited review by courts. This agreement to arbitrate disputes includes all claims whether based in contract, tort, statute, fraud, misrepresentation, or any other legal theory, and regardless of whether a claim arises during or after the termination of these Terms. Any dispute relating to the interpretation, applicability, or enforceability of this binding arbitration agreement will be resolved by the arbitrator.\nYOU UNDERSTAND AND AGREE THAT, BY ENTERING INTO THESE TERMS, YOU AND PACALLZ ARE EACH WAIVING THE RIGHT TO A TRIAL BY JURY OR TO PARTICIPATE IN A CLASS ACTION.',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.0)),
                      Text('\n11.2 Exceptions. ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'Although we are agreeing to arbitrate most disputes between us, nothing in these Terms will be deemed to waive, preclude, or otherwise limit the right of either party to: (a) bring an individual action in small claims court; (b) pursue an enforcement action through the applicable federal, state, or local agency if that action is available; (c) seek injunctive relief in a court of law in aid of arbitration; or (d) to file suit in a court of law to address an intellectual property infringement claim.',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.0)),
                      Text('\n12.Miscellaneous\n\n12.1 General Terms. ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'These Terms, including the Privacy Policy and any other agreements expressly incorporated by reference into these Terms, are the entire and exclusive understanding and agreement between you and PacAllz regarding your use of the Service. You may not assign or transfer these Terms or your rights under these Terms, in whole or in part, by operation of law or otherwise, without our prior written consent. We may assign these Terms and all rights granted under these Terms, including with respect to your User Content, at any time without notice or consent. The failure to require performance of any provision will not affect our right to require performance at any other time after that, nor will a waiver by us of any breach or default of these Terms, or any provision of these Terms, be a waiver of any subsequent breach or default or a waiver of the provision itself. Use of Section headers in these Terms is for convenience only and will not have any impact on the interpretation of any provision. Throughout these Terms the use of the word “including” means “including but not limited to.” If any part of these Terms is held to be invalid or unenforceable, then the unenforceable part will be given effect to the greatest extent possible, and the remaining parts will remain in full force and effect.',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.0)),
                      Text('\n12.2 Privacy Policy. ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'Please read the PacAllz Privacy Policy http://www.foodisgood.com/privacy (the “Privacy Policy”) carefully for information relating to our collection, use, storage, and disclosure of your personal information. The PacAllz Privacy Policy is incorporated by this reference into, and made a part of, these Terms.',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.0)),
                      Text('\n12.3 Additional Terms. ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'Your use of the Service is subject to all additional terms, policies, rules, or guidelines applicable to the Service or certain features of the Service that we may post on or link to from the Service (the “Additional Terms”). All Additional Terms are incorporated by this reference into, and made a part of, these Terms.',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.0)),
                      Text('\n12.4 Consent to Electronic Communications.',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'By using the Service, you consent to receiving certain electronic communications from us as further described in our Privacy Policy. Please read our Privacy Policy to learn more about our electronic communications practices. You agree that any notices, agreements, disclosures, or other communications that we send to you electronically will satisfy any legal communication requirements, including that those communications be in writing.',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.0)),
                      Text('\n12.5 Contact Information. ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'The Service is offered by EA Group, Inc., you can reach out by emailing us at eagroup7273@gmail.com.',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.0)),
                      Text('\n12.6 No Support. ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'We are under no obligation to provide support for the Service. In instances where we may offer support, the support will be subject to published policies.\n\n\nIf you have any questions about these Terms, please feel free to contact us at eagroup7273@gmail.com.',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.0)),
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
    home: TermsAndConditionsPage(),
  ));
}
