// app/dashboard/layout.js
"use client";
import SideNav from '../../components/ui/SideNav';

const DashboardLayout = ({ children }) => {
    return (
        <div className="flex">
            <SideNav /> {/* SideNav stays persistent */}
            <main className="flex-1 p-4">
                {children} {/* This will change based on the route */}
            </main>
        </div>
    );
};

export default DashboardLayout;
