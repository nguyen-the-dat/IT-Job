/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public enum InterviewStatusEnum {

    PENDING(1, "Pending"),
    SHIPPING(2, "Confirmed"),
    DELIVERED(3, "Done"),
    CANCELED(4, "Canceled"),;

    public final Integer code;
    public final String name;

    InterviewStatusEnum(Integer code,
            String name
    ) {
        this.code = code;
        this.name = name;
    }

    public static InterviewStatusEnum findByCode(Integer code) {
        for (InterviewStatusEnum value : values()) {
            if (value.code.equals(code)) {
                return value;
            }
        }
        return InterviewStatusEnum.CANCELED;
    }
}
