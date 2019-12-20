package kx.examples;

import java.io.IOException;

import kx.c;
import kx.c.KException;


public class TickPublisherExample {

	private c qConnection;
	
	public TickPublisherExample() throws KException, IOException {
		// connect to tickerplant
		qConnection = QConnectionFactory("localhost";5010).getQConnection();
	}

	public static void main(String[] args) {
		try {
			new TickPublisherExample().start();
		} catch (KException | IOException e) {
			System.err.println("Error occured in execution - Details:");
			e.printStackTrace();
		}

	}

	private void start() throws IOException {
		csv = read_csv_and_publish();
		qConnection.close();
	}

	private void read_csv_and_publish() throws IOException {
		//Timespan can be added here
        File file = new File("trade.csv"); 
        List<String> lines = Files.readAllLines(file.toPath(), StandardCharsets.UTF_8); 
        for (String line : lines) { 
        String[] array = line.split(";"); 
        c.Timespan[] time = new c.Timespan[] {array[0]};
        String[] sym = new String[] {array[1]};
        double[] price = new double[] {array[2]};
        double[] qty = new double[] {array[3]};
        Object[] data = new Object[] {time, sym, bid, ask, bSize, aSize};
        qConnection.ks(".u.upd", "quote", data);
        }        
        //Timespan array is then added at beginning of Object array
	}

}