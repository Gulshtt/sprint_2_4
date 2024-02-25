package model;

public class Item {
    private Long id;
    private String name;
    private String description;
    private String dedlineDate;
    private boolean isDone;

    public Item(){}
    public Item(Long id, String name, String description, String dedlineDate, boolean state) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.dedlineDate = dedlineDate;
        this.isDone = state;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getdescription() {
        return description;
    }

    public void setdescription(String description) {
        this.description = description;
    }

    public String getdedlineDate() {
        return dedlineDate;
    }

    public void setdedlineDate(String dedlineDate) {
        this.dedlineDate = dedlineDate;
    }

    public boolean isDone(){
        return isDone;
    }

    public void changeState(boolean isDone){
        this.isDone = isDone;
    }
}
