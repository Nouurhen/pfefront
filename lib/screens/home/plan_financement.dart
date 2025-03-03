import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pfefront/controllers/home_controller.dart';
import 'package:pfefront/core/storage/app_storage.dart';
import 'package:pfefront/core/widgets/custom_row_paiement.dart';
import 'package:pfefront/core/widgets/custom_tranche.dart';
import 'package:pfefront/screens/paiement/choix_mode_paiement.dart';

class PlanFinancement extends StatelessWidget {
  final String? montantPremierTranche;
  final String? date;
  final String? total;
  final Widget? widget;
  final int nbrTranche;
  PlanFinancement(
      {super.key,
      this.montantPremierTranche,
      this.date,
      this.total,
      this.widget,
      required this.nbrTranche});
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
     homeController.getContrat();
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: Colors.blue,
          title: const Text(
            "Plan de financements",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 35,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Veuillez confirmer les conditions du paiement',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    //  height: 500,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Versement du premier paiement comptant',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '$montantPremierTranche',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text('le $date'),
                        const SizedBox(height: 16),
                        widget!,
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Text(
                              'TOTAL',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '$total',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 20)),
                    onPressed: () {
                      // if (controller.keyForm.currentState!.validate()) {
                      //   print('form valide');
                      //   controller.createFinancement();
                      // }
                     
                      print("nombre=$nbrTranche");
                      Get.to(
                        ChoixModePaiment(
                          totale: total,
                          widget:
                           nbrTranche == 2
                            ?
                            
                                Column(
                                  children: [
                                     CustomRowPaiement(
                                       date: AppStorage.readDate1(),
                                       montant: AppStorage.readMontant1(),
                                     ),
                                     CustomRowPaiement(
                                       date: AppStorage.readDate2(),
                                      montant: AppStorage.readMontant2(),
                                     ),
                                   ],
                                 )
                               : (nbrTranche == 3)
                                  ? Column(
                                       children: [
                                         CustomRowPaiement(
                                           date: AppStorage.readDate1(),
                                           montant: AppStorage.readMontant1(),
                                         ),
                                         CustomRowPaiement(
                                           date: AppStorage.readDate2(),
                                           montant: AppStorage.readMontant2(),
                                         ),
                                         CustomRowPaiement(
                                          date: AppStorage.readDate3(),
                                           montant: AppStorage.readMontant3(),
                                         ),
                                      ],
                                     )
                                   : Column(
                                       children: [
                                         CustomRowPaiement(
                                           date: AppStorage.readDate1(),
                                           montant: AppStorage.readMontant1(),
                                         ),
                                         CustomRowPaiement(
                                           date: AppStorage.readDate2(),
                                           montant: AppStorage.readMontant2(),
                                         ),
                                         CustomRowPaiement(
                                          date: AppStorage.readDate3(),
                                          montant: AppStorage.readMontant3(),
                                        ),
                                         CustomRowPaiement(
                                         date: AppStorage.readDate4(),
                                           montant: AppStorage.readMontant4(),
                                        ),
                                      ],
                                     ),
                        ),
                      );
                    },
                    child: const Text(
                      "Confirmer",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
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
