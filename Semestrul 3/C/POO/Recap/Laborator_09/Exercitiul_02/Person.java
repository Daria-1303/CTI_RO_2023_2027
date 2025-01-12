/*
                          +------------------+
                          |  <<interface>>   |
                          |   Transmitter    |
                          +------------------+
                          | + store(msg)     |
                          | + retrieve(rcv)  |
                          +------------------+
                                   ^
                                   |
            +-----------------------+----------------------+
            |                                              |
+--------------------+                          +--------------------+
|  EmailTransmitter  |                          |  MailTransmitter  |
+--------------------+                          +--------------------+
| - messages: ArrayList                        | - buffer: Message[] |
|                                              | - count: int        |
| + store(msg)                                 | + store(msg)        |
| + retrieve(rcv)                              | + retrieve(rcv)     |
+--------------------+                          +--------------------+
             ^                                          ^
             |                                          |
+--------------------+                   +--------------------+
|     Message        |                   |       Person       |
+--------------------+                   +--------------------+
| - sender: Person                     | - name: String     |
| - receiver: Person                   | - transmitter      |
| - content: String                    +--------------------+
+--------------------+                   | + setTransmitter()|
| + getSender()                          | + send()         |
| + getReceiver()                        | + notify()       |
| + getContent()                         +--------------------+
| + toString()                            
+--------------------+                               

 */
import java.util.ArrayList;
// Interfața Transmitter
interface Transmitter {
    void store(Message message);
    Message retrieve(Person receiver);
}

// Clasa Message
class Message {
    private Person sender;
    private Person receiver;
    private String content;

    public Message(Person sender, Person receiver, String content) {
        this.sender = sender;
        this.receiver = receiver;
        this.content = content;
    }

    public Person getSender() {
        return sender;
    }

    public Person getReceiver() {
        return receiver;
    }

    public String getContent() {
        return content;
    }

    
    public String toString() {
        return sender.getName() + " said to " + receiver.getName() + " : \"" + content + "\"";
    }
}

// Clasa Person
class Person {
    private String name;
    private Transmitter transmitter;

    public Person(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setTransmitter(Transmitter transmitter) {
        this.transmitter = transmitter;
    }

    public void send(Person receiver, String messageContent) {
        if (transmitter != null) {
            Message message = new Message(this, receiver, messageContent);
            transmitter.store(message);
        }
    }

    public void notify(Message message) {
        System.out.println(message.toString());
    }
}

// Clasa EmailTransmitter

class EmailTransmitter implements Transmitter {
    private ArrayList<Message> messages = new ArrayList<>();

    
    public void store(Message message) {
        messages.add(message);
        // notificare imediată a destinatarului
        message.getReceiver().notify(message);
    }

    
    public Message retrieve(Person receiver) {
        return null; // Notificarea se face imediat, deci retrieve nu este folosit aici.
    }
}

// Clasa MailTransmitter
class MailTransmitter implements Transmitter {
    private Message[] buffer;
    private int count;

    public MailTransmitter(int bufferSize) {
        buffer = new Message[bufferSize];
        count = 0;
    }

    
    public void store(Message message) {
        buffer[count++] = message;
        if (count == buffer.length) { // notificare dacă buffer-ul este plin
            for (int i = 0; i < count; i++) {
                Message m = buffer[i];
                m.getReceiver().notify(m);
            }
            count = 0; // resetăm buffer-ul
        }
    }

    
    public Message retrieve(Person receiver) {
        return null;
    }
}

// Clasa Main
class Main {
    public static void main(String[] args) {
        // 4 persoane
        Person p1 = new Person("Paul");
        Person p2 = new Person("Andreea");
        Person p3 = new Person("Ioana");
        Person p4 = new Person("Gabriel");

        // sistemul de transmitere prin e-mail-uri
        Transmitter email = new EmailTransmitter();
        // sistemul de transmitere prin scrisori, cu un buffer de 2 scrisori
        Transmitter mail = new MailTransmitter(2);

        // Paul trimite un e-mail către Andreea
        p1.setTransmitter(email);
        p1.send(p2, "Scrie-i Ioanei sa-mi dea adresa ei de e-mail!");

        // Andreea trimite o scrisoare către Ioana
        p2.setTransmitter(mail);
        p2.send(p3, "Paul zice sa-i trimiti adresa ta de e-mail");

        // Gabriel trimite o scrisoare către Paul
        p4.setTransmitter(mail);
        p4.send(p1, "Ce mai faci?");

        // Ioana răspunde prin e-mail lui Paul
        p3.setTransmitter(email);
        p3.send(p1, "Adresa mea de e-mail este: ioana@yahoo.com");
    }
}
