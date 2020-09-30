global class myHandler implements Messaging.InboundEmailHandler {
	  global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
		  Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
          
        System.debug('*******email: '+email);
        System.debug('******'+email.ToAddresses+'********'+email.fromAddress);
          return result;
      }
  }