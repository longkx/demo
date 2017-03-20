/**
 *
 */
package demo;

/**
 * @author Administrator
 *
 */
public class CPUTestThread implements Runnable {

	@Override
	public void run() {
		int busyTime = 10;
		int idleTime = busyTime;
		long startTime = 0;
		while (true) {
			startTime = System.currentTimeMillis();
			System.out.println(
					System.currentTimeMillis() + "," + startTime + "," + (System.currentTimeMillis() - startTime));

			// busy loop
			while ((System.currentTimeMillis() - startTime) <= busyTime)
				;
			// idle loop
			try {
				Thread.sleep(idleTime);
			} catch (InterruptedException e) {
				System.out.println(e);
			}
		}
	}

}
