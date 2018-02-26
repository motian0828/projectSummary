package Model;

import java.io.Serializable;

public class Studio implements Serializable {

    private int studio_id;
    private int studio_row_count;
    private int studio_col_count;
    private int studio_flag;
    private String studio_name;
    private String studio_introduction;

    public int getStudio_id() {
        return studio_id;
    }

    public void setStudio_id(int studio_id) {
        this.studio_id = studio_id;
    }

    public int getStudio_row_count() {
        return studio_row_count;
    }

    public void setStudio_row_count(int studio_row_count) {
        this.studio_row_count = studio_row_count;
    }

    public int getStudio_col_count() {
        return studio_col_count;
    }

    public void setStudio_col_count(int studio_col_count) {
        this.studio_col_count = studio_col_count;
    }

    public int getStudio_flag() {
        return studio_flag;
    }

    public void setStudio_flag(int studio_flag) {
        this.studio_flag = studio_flag;
    }

    public String getStudio_name() {
        return studio_name;
    }

    public void setStudio_name(String studio_name) {
        this.studio_name = studio_name;
    }

    public String getStudio_introduction() {
        return studio_introduction;
    }

    public void setStudio_introduction(String studio_introduction) {
        this.studio_introduction = studio_introduction;
    }
}