package mapreduce;

public class data {
    private String id;
    private String type;
    data(String id,String type){
        this.id=id;
        this.type=type;
    }
    public String getId() {
        return id;
    }

    public String getType() {
        return type;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setType(String type) {
        this.type = type;
    }
}
