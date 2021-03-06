package lms.model;

import java.math.BigDecimal;
import java.util.Date;

public class LmsOrderBack {
    private BigDecimal id;

    private String reason;

    private Date datetime;

    private BigDecimal lmsOrderId;

    private LmsOrder lmsOrder;

    public LmsOrder getLmsorder() {
        return lmsOrder;
    }

    public void setLmsorder(LmsOrder lmsorder) {
        this.lmsOrder = lmsorder;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public BigDecimal getLmsOrderId() {
        return lmsOrderId;
    }

    public void setLmsOrderId(BigDecimal lmsOrderId) {
        this.lmsOrderId = lmsOrderId;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"id\":")
                .append(id);
        sb.append(",\"reason\":\"")
                .append(reason).append('\"');
        sb.append(",\"datetime\":\"")
                .append(datetime).append('\"');
        sb.append(",\"lmsOrderId\":")
                .append(lmsOrderId);
        sb.append(",\"lmsOrder\":")
                .append(lmsOrder);
        sb.append('}');
        return sb.toString();
    }
}