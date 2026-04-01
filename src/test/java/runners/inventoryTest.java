package runners;

import com.intuit.karate.junit5.Karate;

class InventoryTest {

    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:features");
    }
}