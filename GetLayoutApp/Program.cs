// See https://aka.ms/new-console-template for more information
using System;
using System.Runtime.InteropServices;

class Program
{
    [DllImport("user32.dll")]
    static extern IntPtr GetForegroundWindow();

    [DllImport("user32.dll")]
    static extern IntPtr GetKeyboardLayout(uint idThread);

    [DllImport("user32.dll")]
    static extern uint GetWindowThreadProcessId(IntPtr hWnd, out uint lpdwProcessId);

    static void Main()
    {
        IntPtr hwnd = GetForegroundWindow();
        uint threadId = GetWindowThreadProcessId(hwnd, out _);
        IntPtr layout = GetKeyboardLayout(threadId);
        int langId = layout.ToInt32() & 0xFFFF;

        if (langId == 0x0419)
            Console.WriteLine("RU");
        else if (langId == 0x0409)
            Console.WriteLine("EN");
        else
            Console.WriteLine("??");
    }
}
