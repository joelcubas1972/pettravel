package Util;

import jakarta.activation.DataSource;
import java.io.*;

public class ByteArrayDataSource implements DataSource {
    private byte[] data;
    private String type;
    private String name = "attachment.dat";

    public ByteArrayDataSource(byte[] data, String type) {
        this.data = data;
        this.type = type;
    }

    public ByteArrayDataSource(InputStream inputStream, String type) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        byte[] temp = new byte[4096];
        int bytesRead;
        while ((bytesRead = inputStream.read(temp)) != -1) {
            buffer.write(temp, 0, bytesRead);
        }
        this.data = buffer.toByteArray();
        this.type = type;
    }

    @Override
    public InputStream getInputStream() throws IOException {
        if (data == null) {
            throw new IOException("No data");
        }
        return new ByteArrayInputStream(data);
    }

    @Override
    public OutputStream getOutputStream() throws IOException {
        throw new IOException("No se admite escritura en ByteArrayDataSource");
    }

    @Override
    public String getContentType() {
        return type;
    }

    @Override
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}