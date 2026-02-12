package Util;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

public class CacheManager {
    private Map<String, CacheEntry> cache = new ConcurrentHashMap<>();
    private long defaultTTL = TimeUnit.MINUTES.toMillis(30); // 30 minutos por defecto
    
    public void put(String key, String value) {
        put(key, value, defaultTTL);
    }
    
    public void put(String key, String value, long ttlMillis) {
        long expiryTime = System.currentTimeMillis() + ttlMillis;
        cache.put(key, new CacheEntry(value, expiryTime));
        
        // Limpiar entradas expiradas periódicamente
        cleanExpiredEntries();
    }
    
    public String get(String key) {
        CacheEntry entry = cache.get(key);
        if (entry == null) {
            return null;
        }
        
        if (System.currentTimeMillis() > entry.expiryTime) {
            cache.remove(key);
            return null;
        }
        
        return entry.value;
    }
    
    public void remove(String key) {
        cache.remove(key);
    }
    
    public void clear() {
        cache.clear();
    }
    
    private void cleanExpiredEntries() {
        long now = System.currentTimeMillis();
        cache.entrySet().removeIf(entry -> now > entry.getValue().expiryTime);
    }
    
    private static class CacheEntry {
        String value;
        long expiryTime;
        
        CacheEntry(String value, long expiryTime) {
            this.value = value;
            this.expiryTime = expiryTime;
        }
    }
}