class Device {
    private String information;
    public Device() {
        information = "";
    }
    public Device(String information) {
        this.information = information;
    }
    public void store(String information) {
        this.information = information;
    }
    public String load() {
        return information;
    }

    public String toString(){
        return "Device";
    }
}

class PhotoDevice extends Device {
    public PhotoDevice(String information) {
        super(information);
    }
    public void takePicture() {
        System.out.println("TakePicture...");
        //String picture = ...
        //Se va apela this.store(picture) pentru stocarea pozei
    }

    public String toString(){
        return "PhotoDevice";
    }
}

class VideoDevice extends Device {
    private String producer;
    public VideoDevice(String information, String producer) {
        super(information);
        this.producer = producer;
    }
    public void film() {
        System.out.println("Film...");
        //String film = ...
        //Se va apela this.store(film) pentru stocarea filmului
    }

    public String toString(){
        return "VideoDevice";
    }
}

class PC {
    private String memory = "";
    private String registry;
    public void store(String information) {
        memory += information;
        registry = information;
    }

    public String load() {
        return registry;
    }
 }

class USB {
    public void transferPCToDevice(PC pc, Device device) {
        String data;
        data = pc.load();
        device.store(data);
        
        System.out.println("PC -> " + device.toString() + " : " +  data);
    }
}

class Main {
    public static void main(String[] args) {
        Device device = new Device();
        PhotoDevice photoDevice = new PhotoDevice("PhotoDevice");
        VideoDevice videoDevice = new VideoDevice("VideoDevice", "Producer");
        PC pc = new PC();
        USB usb = new USB();
        pc.store("Information");
        
        
        usb.transferPCToDevice(pc, device);
        usb.transferPCToDevice(pc, photoDevice);
        usb.transferPCToDevice(pc, videoDevice);
    }
}

