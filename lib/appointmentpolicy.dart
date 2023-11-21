import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental/utils/app_colors.dart';

class AppoimentPolicy extends StatelessWidget {
  const AppoimentPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Appoinment '),
      ),
      body: Container(
    
       
        color: Color.fromARGB(255, 255, 254, 254),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text('Book Your Appoinment',style: GoogleFonts.poppins(
                                            fontSize: 16, fontWeight: FontWeight.w700,
                                          ),),
               Text('Our online video consultation service gives you direct access to qualified doctors for on-demand appointments or for scheduled appointments at a time that suits you.',style: GoogleFonts.poppins(
                                            fontSize: 16,fontWeight: FontWeight.w300,
                                          ),),

                                        const  SizedBox(height: 15,),
             Text('Register or Login',style: GoogleFonts.poppins(
                                            fontSize: 16, fontWeight: FontWeight.w700,
                                          ),),
              Text('Enter or confirm your personal details so we know who you are and the doctor knows your current medical history.',style: GoogleFonts.poppins(
                                            fontSize: 16,fontWeight: FontWeight.w300,
                                          ),),

                                          const  SizedBox(height: 15,),

                                          
               Text('Confirm Your Appointment',style: GoogleFonts.poppins(
                                            fontSize: 16, fontWeight: FontWeight.w700,
                                          ),),
                Text('Complete your appointment booking by confirming your preferred time and practitioner and providing consent prior to online payment.',style: GoogleFonts.poppins(
                                            fontSize: 16,fontWeight: FontWeight.w300,
                                          ),),

                                          const  SizedBox(height: 15,),
                 Text('Contact with your Doctor',style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),),
                 Text('Join the video call using your smartphone, tablet or computer and discuss your medical concerns with your doctor. A prescription, referral or medical certificate may be provided.',style: GoogleFonts.poppins(
                                             fontSize: 16,fontWeight: FontWeight.w300,
                                          ),),
            ],
        
      ),)
      )
    );
  }
}